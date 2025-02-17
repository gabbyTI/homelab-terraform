# module "vm_set1" {
#   source = "../../_modules/proxmox-vm/" # Path to your module

#   # VM Configuration
#   vm_count          = 2
#   vm_name           = "my-demo-vm-set1"
#   vm_desc           = "VM set 1 description"
#   target_node       = "pve"
#   template_name     = "ubuntu-server-24-04-lts-noble-numbat"
#   memory            = 2048 # Default is 2048, but can be overridden here
#   cores             = 2
#   sockets           = 1
#   ciuser            = "admin"
#   cipassword        = "password"
#   network_bridge    = "vmbr0"
#   cloudinit_storage = "local-lvm"
#   disk_size         = "20G"
#   disk_storage      = "vm-disks"
#   disk_discard      = true
#   tags = "staging,demo1"
# }

module "vm_set2" {
  source = "../../_modules/proxmox-vm/" # Path to your module
  # VM Configuration
  vm_count          = 1
  vm_name           = "my-demo-vm-set2"
  vm_desc           = "VM set 2 description"
  target_node       = "pve"
  template_name     = "ubuntu-server-24-04-lts-noble-numbat"
  memory            = 4096 # Override the memory for this set of VMs (4GB)
  cores             = 4
  sockets           = 1
  ciuser            = "admin"
  cipassword        = "strong_staging_password"
  network_bridge    = "vmbr0"
  disk_size         = "20G"
  disk_storage      = "vm-disks"
  disk_discard      = false
  tags = "staging,demo2"

}
