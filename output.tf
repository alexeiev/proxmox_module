output "vm_name" {
  value = "${proxmox_vm_qemu.create_vm[*].name}"
}

output "ip_address" {
  value = "${proxmox_vm_qemu.create_vm[*].default_ipv4_address}"
}
