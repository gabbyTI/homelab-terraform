output "vm_names" {
  description = "The names of the created VMs"
  value       = [for vm in proxmox_vm_qemu.vm : vm.name]
}

output "vm_ids" {
  description = "The Proxmox IDs of the created VMs"
  value       = { for name, vm in proxmox_vm_qemu.vm : name => vm.vmid }
}

output "vm_ips" {
  description = "The primary IP addresses of the created VMs"
  value       = { for name, vm in proxmox_vm_qemu.vm : name => vm.default_ipv4_address }
}
