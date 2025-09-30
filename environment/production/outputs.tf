# Output the VM's primary IPv4 address
output "tailscale_ip" {
  description = "The outputs of the tailscale VM"
  value       = module.tailscale.vm_ips[0]
}

output "tutorailvm_ip" {
  description = "The outputs of the tutorailvm VM"
  value       = module.tutorailvm.vm_ips[0]
}