variable "vm_id" {
  type = number
  description = "Virtual Machine ID"
}

variable "vm_qnt" {
  type = number
  default = 1
}

variable "vm_name" {
  type = string
  description = "Virtual Machine Name"
}

variable "vm_template" {
  type = string
  default = "ubuntu-2204-v20240213"
}

variable "srv_target_node" {
  type = string
  default = "hp01"
}

variable "vm_ip_address" {
  type = list(string)
  description = "ip address list"
}

variable "username-so" {
  type        = string
  description = "Username cloud-init"
  default     = "alexeiev" 
}

variable "sshkeys" {
  type        = string
  description = "ssh key"
  default     = ""
}

variable "environment" {
  type        = string
  description = "Set Environment (DEV|QUA|PROD)"
  default     = "DEV"
}