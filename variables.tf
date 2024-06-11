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

variable "site" {
  type        = string
  description = "URL to Proxmox"
}

variable "memory" {
  type = number
  description = "Memory in MB"
  default = 1024
}

variable "cores" {
  type = number
  description = "CPU cores for VM"
  default = 1
}