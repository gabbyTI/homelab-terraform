resource "proxmox_vm_qemu" "vm" {
  for_each = local.talos_nodes

  name        = each.key
  description = "Talos ${each.value.role}"
  target_node = each.value.target_node
  tags        = var.tags
  onboot      = var.onboot

  agent         = 1
  agent_timeout = 300
  memory        = var.memory

  boot = "order=scsi0;ide2;net0"

  cpu {
    cores   = var.cores
    sockets = var.sockets
    type    = "host"
  }

  os_type = "cloud-init"
  scsihw  = "virtio-scsi-pci"

  ipconfig0 = var.ipconfig0

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
          storage = var.cloudinit_storage
        }
      }
      ide2 {
        cdrom {
          iso = var.iso
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
