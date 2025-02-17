# VM Configuration Variables
variable "vm_count" {
  description = "Number of VMs to create (default: 1)"
  type        = number
  default     = 1
}

variable "vm_name" {
  description = "Base name of the VM"
  type        = string
}

variable "vm_desc" {
  description = "Description of the VM (default: \"\")"
  type        = string
  default     = null
}

variable "target_node" {
  description = "Proxmox node to deploy the VM on"
  type        = string
}

variable "template_name" {
  description = "Template name to clone"
  type        = string
}

variable "memory" {
  description = "Memory size in MB (default: 2048)"
  type        = number
  default     = 2048
}

variable "cores" {
  description = "Number of CPU cores (default: 2)"
  type        = number
  default     = 2
}

variable "sockets" {
  description = "Number of CPU sockets (default: 1)"
  type        = number
  default     = 1
}

variable "ciuser" {
  description = "Cloud-init username"
  type        = string
}

variable "cipassword" {
  description = "Cloud-init password"
  type        = string
  sensitive   = true
}

variable "network_bridge" {
  description = "Network bridge to attach to"
  type        = string
}

variable "disk_size" {
  description = "Disk size for VM"
  type        = string
}

variable "disk_storage" {
  description = "Storage location for disk (default: vm-disks)"
  type        = string
  default     = "vm-disks"
}

variable "disk_discard" {
  description = "Enable or disable discard (TRIM) for the disk (useful for SSD storage)"
  type        = bool
}

variable "tags" {
  description = "Comma separated list of tags to apply to the VM (default: \"\")"
  type        = string
  default     = ""
}