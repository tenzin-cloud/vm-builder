terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~>0.9"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }

}

provider "libvirt" {
  uri = "qemu:///system"
}

module "centos-vm" {

  count  = var.vm_os == "centos-vm" ? var.vm_count : 0
  source = "./modules/centos-vm"
  name   = "${var.vm_name}-${count.index}"

  cloud_image_url = var.vm_cloud_image_url

  console_user     = var.vm_console_user
  console_password = var.vm_console_password

  automation_user        = var.vm_automation_user
  automation_user_pubkey = var.vm_automation_user_pubkey

  # vm settings
  cpu_count       = var.vm_cpu_count
  memory_size_gib = var.vm_memory_size_gib
  disk_sizes_gib  = var.vm_disk_sizes_gib

  launch_script = templatefile("${path.module}/templates/${var.vm_os}-launch_script.sh", {})
}

module "ubuntu-vm" {

  count  = var.vm_os == "ubuntu-vm" ? var.vm_count : 0
  source = "./modules/ubuntu-vm"
  name   = "${var.vm_name}-${count.index}"

  cloud_image_url = var.vm_cloud_image_url

  automation_user        = var.vm_automation_user
  automation_user_pubkey = var.vm_automation_user_pubkey

  console_user     = var.vm_console_user
  console_password = var.vm_console_password

  # vm settings
  cpu_count       = var.vm_cpu_count
  memory_size_gib = var.vm_memory_size_gib
  disk_sizes_gib  = var.vm_disk_sizes_gib

  # gpu settings
  # has_gpu_passthru = true
  # gpu_pci_bus      = "03"

  launch_script = templatefile("${path.module}/templates/${var.vm_os}-launch_script.sh", {})
}

module "archlinux-vm" {

  count  = var.vm_os == "archlinux-vm" ? var.vm_count : 0
  source = "./modules/archlinux-vm"
  name   = "${var.vm_name}-${count.index}"

  cloud_image_url = var.vm_cloud_image_url

  automation_user        = var.vm_automation_user
  automation_user_pubkey = var.vm_automation_user_pubkey

  console_user     = var.vm_console_user
  console_password = var.vm_console_password

  # vm settings
  cpu_count       = var.vm_cpu_count
  memory_size_gib = var.vm_memory_size_gib
  disk_sizes_gib  = var.vm_disk_sizes_gib

  launch_script = templatefile("${path.module}/templates/${var.vm_os}-launch_script.sh", {})
}
