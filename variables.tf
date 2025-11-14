variable "vm_count" {
  type        = number
  default     = 1
  description = "The number of VM(s) to create"
}

variable "vm_name" {
  type        = string
  default     = "vm"
  description = "The name to give to the VM(s)"
}

variable "vm_cpu_count" {
  type        = number
  default     = 2
  description = "The CPU count of the VM(s)"
}

variable "vm_memory_size_gib" {
  type        = number
  default     = 4
  description = "The memory size of the VM(s) in GiB"
}

variable "vm_disk_sizes_gib" {
  type        = list(number)
  default     = [48]
  description = "The disk size of the VM(s) in GiB, the first element is the root disk size, followed by data disks if any, with max of 8 disks."
}

variable "vm_console_user" {
  type        = string
  description = "The username of the console user"
}

variable "vm_console_password" {
  type        = string
  sensitive   = true
  description = "The password of the console user"
}

variable "vm_automation_user" {
  type        = string
  description = "The username of the remote SSH user"
}

variable "vm_automation_user_pubkey" {
  type        = string
  description = "The SSH public key of the remote SSH user"
}
