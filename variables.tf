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
