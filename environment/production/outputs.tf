# Output the VM's primary IPv4 address
output "tailscale_ip" {
  description = "The outputs of the tailscale VM"
  value       = module.tailscale.vm_ips[0]
}

output "tutorailvm_ip" {
  description = "The outputs of the tutorailvm VM"
  value       = module.tutorailvm.vm_ips[0]
}

output "authentik_ip" {
  description = "The outputs of the authentik VM"
  value       = module.authentik.vm_ips[0]
}

# output "gitlab_ip" {
#   description = "The outputs of the gitlab VM"
#   value       = module.gitlab.vm_ips[0]
# }
