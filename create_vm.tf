resource "proxmox_vm_qemu" "create_vm" {
  agent = 1
  count = var.vm_qnt
  name = var.vm_qnt > 1 ? "${var.vm_name}${count.index +1}" : "${var.vm_name}"
  desc = var.vm_qnt > 1 ? "${var.vm_name}${count.index +1}" : "${var.vm_name}"
  vmid = var.vm_qnt > 1 ? var.vm_id+count.index : var.vm_id
  target_node = "${var.srv_target_node}"
  clone = var.vm_template
  cores = var.vm_cpu
  sockets = 1
  cpu = "host"
  memory = var.vm_memory
  tags = var.environment
  onboot = var.environment == "PROD" ? true : false

  network {
    bridge = var.net
    tag   = var.net_vlan
    model = "virtio"
  } 

  disk {
    storage = "nfs"
    type = "scsi"
    size = "${var.vm_disk}G"
  }
  
  os_type = "cloud-init"
  ipconfig0 =  var.vm_ip_address[count.index]
  ciuser = var.username-so
  sshkeys = <<EOF
  ${var.sshkeys}
  EOF
}