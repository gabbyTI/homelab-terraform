variable "iso" {
  description = "The ISO file to boot from (e.g., local:iso/nocloud-amd64.iso)"
  type        = string
  default     = "local:iso/nocloud-amd64.iso"
}

variable "memory" {
  description = "Memory size in MB"
  type        = number
  default     = 4096
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "sockets" {
  description = "Number of CPU sockets"
  type        = number
  default     = 1
}

variable "network_bridge" {
  description = "The Proxmox network bridge to use"
  type        = string
  default     = "vmbr1"
}

variable "disk_size" {
  description = "The size of the main disk (e.g., 40G)"
  type        = string
}

variable "disk_storage" {
  description = "The Proxmox storage identifier for the disk"
  type        = string
  default     = "vm-disks"
}

variable "cloudinit_storage" {
  description = "The Proxmox storage identifier for the cloud-init drive"
  type        = string
  default     = "local-lvm"
}

variable "disk_discard" {
  description = "Whether to enable discard (TRIM) for the disk"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Comma separated list of tags to apply to the VM"
  type        = string
  default     = "kubernetes,talos"
}

variable "onboot" {
  description = "Whether to start the VM on Proxmox boot"
  type        = bool
  default     = true
}

variable "ipconfig0" {
  description = "IP configuration for the first network interface"
  type        = string
  default     = "ip=dhcp"
}
