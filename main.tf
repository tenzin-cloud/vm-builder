terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.8.3"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }

}

provider "libvirt" {
  uri = "qemu:///system"
}

module "virtual_machines" {

  count  = var.vm_count
  source = "./modules/ubuntu-vm"
  name   = "${var.vm_name}-${count.index}"

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

  launch_script = templatefile("${path.module}/templates/launch_script.sh", {})
}
