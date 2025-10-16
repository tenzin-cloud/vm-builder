variable "vm_count" {
  type    = number
  default = 1
}

variable "vm_cpu_count" {
  type    = number
  default = 2
}

variable "vm_name" {
  type    = string
  default = "vm"
}

variable "vm_memory_size_gib" {
  type    = number
  default = 4
}

variable "vm_root_disk_size_gib" {
  type    = number
  default = 48
}

variable "vm_console_user" {
  type = string
}

variable "vm_console_password" {
  type      = string
  sensitive = true
}

variable "vm_automation_user" {
  type = string
}

variable "vm_automation_user_pubkey" {
  type = string
}
