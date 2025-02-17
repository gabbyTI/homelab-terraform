resource "proxmox_vm_qemu" "vm" {
  count       = var.vm_count
  name        = var.vm_count > 1 ? "${var.vm_name}-${count.index + 1}" : var.vm_name
  desc        = var.vm_desc
  tags        = var.tags
  target_node = var.target_node

  agent      = 1
  clone      = var.template_name
  full_clone = true
  memory     = var.memory
  cores      = var.cores
  cpu_type   = "host"
  sockets    = var.sockets
  os_type    = "cloud-init"
  scsihw     = "virtio-scsi-single"
  onboot     = true

  ipconfig0  = "ip=dhcp"
  ciuser     = var.ciuser
  cipassword = var.cipassword

  network {
    id     = 0
    model  = "virtio"
    bridge = var.network_bridge
  }

  serial {
    id   = 0
    type = "socket"
  }

  disks {
    ide {
      ide0 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size    = var.disk_size
          storage = var.disk_storage
          discard = var.disk_discard
          format  = "qcow2"
        }
      }
    }
  }
}
