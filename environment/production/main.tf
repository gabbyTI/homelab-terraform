module "tailscale" {
  source = "../../_modules/proxmox-vm/" # Path to your module

  # VM Configuration
  vm_name           = "tailscale"
  target_node       = "pve"
  template_name     = "ubuntu-server-24-04-lts-noble-numbat"
  memory            = 1024 # Override the memory for this set of VMs (4GB)
  cores             = 1
  ciuser            = var.default_user
  cipassword        = var.default_password
  network_bridge    = "vmbr0"
  disk_size         = "20G" # can only increase size
  disk_discard      = true
  tags              = "production,vpn"
}