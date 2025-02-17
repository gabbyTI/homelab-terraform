# Proxmox VM Terraform Module

This Terraform module automates the provisioning of virtual machines (VMs) on a Proxmox server using cloud-init templates.

## Features
- Creates one or multiple VMs
- Clones from an existing Proxmox cloud-init template
- Supports disk resizing, network configuration, and VM tagging
- Enables Proxmox agent and cloud-init for automation

## Requirements
- Terraform >= 1.0
- Proxmox >= 6.0
- Proxmox API access with appropriate permissions

## Usage

```hcl
module "proxmox_vm" {
  source        = "./modules/proxmox-vm"
  vm_count      = 1
  vm_name       = "my-vm"
  target_node   = "pve"
  template_name = "ubuntu-server-24-04-lts"
  memory        = 2048
  cores         = 2
  sockets       = 1
  ciuser        = "admin"
  cipassword    = "securepassword"
  network_bridge = "vmbr0"
  disk_size     = "20G"
  disk_storage  = "local-lvm"
  disk_discard  = true
  tags          = "terraform,homelab"
}
```

## Inputs

| Variable       | Description                                      | Type    | Default   |
|---------------|--------------------------------------------------|---------|-----------|
| vm_count      | Number of VMs to create                         | number  | 1         |
| vm_name       | Base name of the VM                             | string  | n/a       |
| target_node   | Proxmox node to deploy on                       | string  | n/a       |
| template_name | Proxmox template to clone                       | string  | n/a       |
| memory        | RAM in MB                                       | number  | 2048      |
| cores         | Number of CPU cores                             | number  | 2         |
| sockets       | Number of CPU sockets                           | number  | 1         |
| ciuser        | Cloud-init username                             | string  | n/a       |
| cipassword    | Cloud-init password                             | string  | n/a       |
| network_bridge | Network bridge                                 | string  | "vmbr0"   |
| disk_size     | VM disk size                                    | string  | "20G"     |
| disk_storage  | Storage location                                | string  | "vm-disks"|
| disk_discard  | Enable TRIM (SSD optimization)                  | bool    | true      |
| tags          | VM tags                                         | string  | ""        |

## Outputs

| Output  | Description                            |
|---------|----------------------------------------|
| vm_ips  | List of primary IPv4 addresses        |
| vm_ids  | List of unique Proxmox VM IDs         |

## Notes
- The `template_name` must exist on Proxmox before running Terraform.
- The module supports creating multiple VMs by increasing `vm_count`.
- Ensure that cloud-init is properly configured on the Proxmox template.

## License
MIT License

