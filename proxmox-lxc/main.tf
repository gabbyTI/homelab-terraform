resource "proxmox_lxc" "lxc" {
  hostname      = "web-container"
  target_node   = "pve"
  ostemplate    = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
  password      = "password"
  unprivileged  = true
  cores         = 1
  memory        = 512
  swap          = 512


  rootfs {
    storage = "vm-disks"
    size    = "10G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.2.50/24"
  }

  onboot = true
}
