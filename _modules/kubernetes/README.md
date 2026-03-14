# Kubernetes (Talos Linux) Module

This module provisions a set of Proxmox Virtual Machines specifically optimized for **Talos Linux**. It is designed to create a "no-template" environment, booting directly from an ISO (e.g., `nocloud-amd64.iso`) to allow for a clean, immutable Kubernetes installation.

## Features

- **ISO-Based Provisioning**: No need for pre-existing templates.
- **Dynamic Node Scaling**: Uses a local map to define control-plane and worker nodes.
- **Talos Optimized**: Sets CPU type to `host` and uses `virtio` for maximum performance.
- **Cloud-Init (NoCloud)**: Includes a cloud-init drive (IDE0) required for Talos to detect configuration.
- **Configurable Storage**: Seperate variables for main OS disks and Cloud-init drives.

## File Structure

- `main.tf`: Core Proxmox resource definitions.
- `local.tf`: Node configuration (names, roles, target nodes).
- `variables.tf`: Input variables for hardware and network customization.
- `outputs.tf`: Exports node names, IDs, and IP addresses.
- `providers.tf`: Provider requirements.

## Usage

Define your nodes in `local.tf`:

```hcl
locals {
  talos_nodes = {
    "talos-master-01" = { role = "control-plane", target_node = "pve" },
    "talos-worker-01" = { role = "worker", target_node = "pve" }
  }
}
```

Call the module in your environment:

```hcl
module "kubernetes" {
  source = "../../_modules/kubernetes"

  iso               = "local:iso/nocloud-amd64.iso"
  disk_size         = "40G"
  disk_storage      = "vm-disks"
  cloudinit_storage = "local-lvm"
  memory            = 4096
  cores             = 2
}
```

## Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `iso` | The ISO file to boot from | `string` | `local:iso/nocloud-amd64.iso` |
| `memory` | Memory size in MB | `number` | `4096` |
| `cores` | Number of CPU cores | `number` | `2` |
| `sockets` | Number of CPU sockets | `number` | `1` |
| `network_bridge` | Proxmox network bridge | `string` | `vmbr1` |
| `disk_size` | Main disk size (e.g., 40G) | `string` | - |
| `disk_storage` | Storage pool for main disk | `string` | `vm-disks` |
| `cloudinit_storage`| Storage pool for cloud-init drive | `string` | `local-lvm` |
| `onboot` | Start VM on Proxmox boot | `bool` | `true` |
| `tags` | Comma separated tags | `string` | `kubernetes,talos` |

## Outputs

- `vm_names`: List of all node names.
- `vm_ids`: Map of node names to Proxmox VM IDs.
- `vm_ips`: Map of node names to IP addresses (once assigned).
