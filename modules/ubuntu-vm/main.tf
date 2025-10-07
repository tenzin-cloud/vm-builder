terraform {
  required_version = "~> 1.9"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~> 0.8"
    }
  }
}

resource "libvirt_pool" "datastore" {
  name = "datastore-${var.name}"
  type = "dir"
  target {
    path = "/data/datastore/${var.name}"
  }
}

resource "libvirt_volume" "ubuntu_cloud_image" {
  source = "noble-server-cloudimg-amd64.img"
  name   = "noble-server-cloudimg-amd64.img"
  pool   = libvirt_pool.datastore.name
  format = "qcow2"
}

resource "libvirt_cloudinit_disk" "cloudinit_iso" {
  name = "${var.name}-cloudinit-seed.iso"
  user_data = templatefile("${path.module}/templates/cloud-init.user-data.yaml", {
    hostname               = var.name
    launch_script          = var.launch_script
    automation_user        = var.automation_user
    automation_user_pubkey = var.automation_user_pubkey
    console_user           = var.console_user
    console_password       = var.console_password
    has_gpu_passthru       = var.has_gpu_passthru
  })
  network_config = file("${path.module}/files/cloud-init.network-config.yaml")
  pool           = libvirt_pool.datastore.name
}

resource "libvirt_volume" "root_disk" {
  name             = "${var.name}-root-disk.qcow2"
  base_volume_name = libvirt_volume.ubuntu_cloud_image.name
  base_volume_pool = libvirt_pool.datastore.name
  size             = var.disk_size_mib * 1024 * 1024 // size must be in bytes
  pool             = libvirt_pool.datastore.name
}

resource "libvirt_domain" "machine" {
  name      = var.name
  autostart = var.autostart
  memory    = var.memory_size_mib
  vcpu      = var.cpu_count
  cpu {
    mode = "host-passthrough"
  }
  machine = "q35"

  firmware = "/usr/share/OVMF/OVMF_CODE_4M.fd"
  nvram {
    file = "/var/lib/libvirt/qemu/nvram/${var.name}-VARS.fd"
  }

  xml {
    xslt = var.has_gpu_passthru ? templatefile("${path.module}/templates/gpu-transform.xslt", { gpu_pci_bus = var.gpu_pci_bus }) : file("${path.module}/files/base-transform.xslt")
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  network_interface {
    hostname = var.name
    bridge   = "br0"
  }

  cloudinit = libvirt_cloudinit_disk.cloudinit_iso.id
  disk {
    volume_id = libvirt_volume.root_disk.id
  }

  lifecycle {
    ignore_changes = [
      cloudinit
    ]
  }
}
