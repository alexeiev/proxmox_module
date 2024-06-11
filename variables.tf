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

variable "vm_memory" {
  type = number
  description = "Memory in MB"
  default = 1024
}

variable "vm_cpu" {
  type = number
  description = "Number of processors of the VM"
  default = 1
}

variable "vm_disk" {
  type = number
  description = "Disk in GB"
  default = "30"
}

variable "net" {
  type = string
  description = "Interface name"
  default = "vmbr0"
}

variable "net_vlan" {
  type = number
  description = "Vlan Tag for segmented network"
  default = -1
}