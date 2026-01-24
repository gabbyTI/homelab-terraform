module "tailscale" {
  source = "../../_modules/proxmox-vm/" # Path to your module

  # VM Configuration
  vm_name       = "tailscalevm"
  target_node   = "pve"
  template_name = "ubuntu-noble-1745509880"
  memory        = 2048 # Override the memory for this set of VMs (4GB)
  cores         = 1
  # ciuser            = var.default_user
  # cipassword        = var.default_password
  network_bridge = "vmbr1"
  disk_size      = "20G" # can only increase size
  disk_discard   = true
  tags           = "production,vpn"
}

module "tutorailvm" {
  source = "../../_modules/proxmox-vm/" # Path to your module

  # VM Configuration
  vm_name       = "tutorailvm"
  target_node   = "pve"
  template_name = "ubuntu-noble-1745509880"
  memory        = 4096 # Override the memory for this set of VMs (4GB)
  cores         = 2
  # ciuser            = var.default_user
  # cipassword        = var.default_password
  network_bridge = "vmbr0"
  disk_size      = "20G" # can only increase size
  disk_discard   = true
  tags           = "training"
}

module "authentik" {
  source = "../../_modules/proxmox-vm/" # Path to your module

  # VM Configuration
  vm_name       = "authentik"
  target_node   = "pve"
  template_name = "ubuntu-noble-1745509880"
  memory        = 8192 # Override the memory for this set of VMs (4GB)
  cores         = 4
  # ciuser            = var.default_user
  # cipassword        = var.default_password
  network_bridge = "vmbr1"
  disk_size      = "20G" # can only increase size
  disk_discard   = true
  tags           = "sso"
}

# module "gitlab" {
#   source = "../../_modules/proxmox-vm/" # Path to your module

#   # VM Configuration
#   vm_name           = "gitlab"
#   target_node       = "pve"
#   template_name     = "ubuntu-noble-1745509880"
#   memory            = 8192
#   cores             = 4
#   # ciuser            = var.default_user
#   # cipassword        = var.default_password
#   network_bridge    = "vmbr0"
#   disk_size         = "20G" # can only increase size
#   disk_discard      = true
#   tags              = "ci"
# }
