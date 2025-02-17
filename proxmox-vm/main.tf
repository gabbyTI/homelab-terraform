resource "proxmox_vm_qemu" "vm" {
  count = var.vm_count
  name  = var.vm_count > 1 ? "my-demo-${count.index + 1}" : "my-demo"
  # name        = "demo-1"
  desc = "Demo VM"
  # vmid        = 400
  target_node = "pve"

  agent = 1

  clone      = "ubuntu-server-24-04-lts-noble-numbat"
  full_clone = true

  memory   = 2048
  cores    = 2
  cpu_type = "host"
  sockets  = 1


  os_type    = "cloud-init"
  ipconfig0  = "ip=dhcp"
  ciuser     = "admin"
  cipassword = "password"

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
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
          size    = "20G"
          storage = "vm-disks"
          discard = true
        }
      }
    }
  }

}
