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

  count  = 1
  source = "./modules/ubuntu-vm"
  name   = "vm-${count.index}"

  automation_user        = var.vm_automation_user
  automation_user_pubkey = var.vm_automation_user_pubkey

  console_user     = var.vm_console_user
  console_password = var.vm_console_password

  # vm settings
  cpu_count       = 2
  memory_size_mib = 4 * 1024  // gib
  disk_size_mib   = 48 * 1024 // gib

  # gpu settings
  # has_gpu_passthru = true
  # gpu_pci_bus      = "03"

  launch_script = templatefile("${path.module}/templates/launch_script.sh", {})
}
