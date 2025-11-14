variable "name" {
  type        = string
  description = "The name of the virtual machine"
}

variable "memory_size_gib" {
  type    = number
  default = 2
}

variable "disk_sizes_gib" {
  type    = list(number)
  default = [8]
}

variable "cpu_count" {
  type    = number
  default = 2
}

variable "launch_script" {
  type        = string
  default     = ""
  description = "The a custom script to run on the machine after cloud-init has finished"
}

variable "console_user" {
  type    = string
  default = "arch"
}

variable "console_password" {
  type      = string
  sensitive = true
}

variable "automation_user" {
  type    = string
  default = "arch"
}

variable "automation_user_pubkey" {
  type = string
}

variable "autostart" {
  type        = bool
  default     = true
  description = "Autostart the VM on hypervisor boot"
}

variable "cloud_image_url" {
  type    = string
  default = "https://geo.mirror.pkgbuild.com/images/latest/Arch-Linux-x86_64-cloudimg.qcow2"
}
