
# Output the VM's primary IPv4 address
output "vm_ips" {
  description = "The primary IPv4 address of the created VM"
  value       = proxmox_vm_qemu.vm[*].default_ipv4_address
}

# Output the VM's unique identifier
output "vm_ids" {
  description = "The unique identifier (VMID) of the created VM"
  value       = [for vm in proxmox_vm_qemu.vm : split("/", vm.id)[2]]
}
