terraform {
  required_version = ">= 0.13.0"
  required_providers {
    proxmox = {
        source = "telmate/proxmox"
        version = "2.9.13"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://${var.site}:8006/api2/json"
  pm_tls_insecure = true
}
