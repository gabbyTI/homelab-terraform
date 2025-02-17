
# Proxmox API connection variables
variable "proxmox_api_url" {
  type        = string
  description = "The Proxmox API endpoint URL"
}

variable "proxmox_api_token_id" {
  type        = string
  description = "Proxmox API token ID"
  sensitive   = true
}

variable "proxmox_api_token_secret" {
  type        = string
  description = "Proxmox API token secret"
  sensitive   = true
}

# # VM Configuration Variables
# variable "vm_name" {
#   type = string
#   description = "Name of the virtual machine"
# }

# # variable "desc" {
# #   type = string
# #   description = "Description of the virtual machine"
# #   default = "Created by XXXXXXXXX"
# # }

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}

# variable "proxmox_node" {
#   type = string 
#   description = "Name of the Proxmox node"
# }

# variable "template_name" {
#   type = string
#   description = "Name of the VM template to clone from"
# }

# variable "cpu_cores" {
#   type = number
#   description = "Number of CPU cores"
#   default = 2
# }

# variable "memory" {
#   type = number
#   description = "Amount of memory in MB"
#   default = 2048
# }

# variable "disk_size" {
#   type = string
#   description = "Size of the primary disk (e.g. '10G')"
#   default = "10G"
# }

# variable "storage_pool" {
#   type = string
#   description = "Proxmox storage pool for VM disk"
#   default = "local-lvm"
# }

# variable "network_bridge" {
#   type = string
#   description = "Network bridge to attach VM to"
#   default = "vmbr0"
# }

# variable "ssh_public_key" {
#   type = string
#   description = "SSH public key for VM access"
#   sensitive = true
# }

