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
  cpu_type = "host"
  memory = var.vm_memory
  boot = "order=scsi0;net0"
  bios = "ovmf"
  scsihw = "virtio-scsi-pci"
  tags = var.environment
  onboot = var.environment == "prod" ? true : false

  network {
    id     = 0
    bridge = var.net == "" ? "vmbr0" : var.net
    tag   = var.net_vlan == "" ? 0 : var.net_vlan
    model = "virtio"
  } 

  disks { 
    scsi {
      scsi0 {
        disk {
          storage = var.vm_storage
          format  = var.vm_storage == "local-lvm" ? "raw" : var.vm_storage_type
          size    = var.vm_disk <= 20 ? "20G" : "${var.vm_disk}G"
        }
      }
      scsi1 {
        cloudinit {
          storage = var.vm_storage
        }
      }
    }
  }
  
  os_type = "cloud-init"
  ipconfig0 =  var.vm_ip_address[count.index] == "" ? "ip=dhcp" : var.vm_ip_address[count.index]
  ciuser = var.username-so
  sshkeys = <<EOF
  ${var.sshkeys}
  EOF
}