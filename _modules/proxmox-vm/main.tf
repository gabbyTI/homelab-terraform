resource "proxmox_vm_qemu" "vm" {
  count       = var.vm_count
  vmid        = var.vmid
  name        = var.vm_count > 1 ? "${var.vm_name}-${count.index + 1}" : var.vm_name
  desc        = var.vm_desc
  tags        = var.tags
  target_node = var.target_node

  agent         = 1
  agent_timeout = 300
  clone         = var.template_name
  full_clone = true
  memory     = var.memory

  cpu {
    cores   = var.cores
    sockets = var.sockets
    type    = "host"
  }

  os_type    = "cloud-init"
  scsihw     = "virtio-scsi-single"
  onboot     = true

  ipconfig0  = "ip=dhcp"

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
