## **Homelab Terraform**

This repository contains Terraform configurations for managing VMs in my **Proxmox-based homelab**. It supports multiple environments (**production**, **staging**) and follows an Infrastructure-as-Code (IaC) approach.

---

### **📁 Repository Structure**
```
homelab-terraform/
│── _modules/proxmox-vm/   # Terraform module for Proxmox VMs
│── environment/
│   ├── production/        # Production environment
│   │   ├── main.tf        # Main Terraform configuration
│   │   ├── providers.tf   # Terraform provider settings
│   │   ├── variables.tf   # Variable definitions
│   │   ├── outputs.tf     # Output values
│   │   ├── terraform.tfstate (git ignored)
│   ├── staging/           # Staging environment (similar structure)
│── README.md              # This file
```

---

### **🚀 Features**
✅ **Automated Proxmox VM provisioning** via Terraform
✅ **Modular structure** for scalability and reuse
✅ **Multiple environments** (production, staging)

---

### **⚙️ Requirements**
- **Proxmox VE** (Tested on Proxmox **7.x/8.x**)
- **Terraform** (>= 1.x)
- **Proxmox API Credentials**
- **Cloud-Init Compatible VM Templates**

---

### **📌 Setup**
#### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/yourusername/homelab-terraform.git
cd homelab-terraform/<environment-folder>
```

#### **2️⃣ Set Up Terraform**
```sh
terraform init
```

#### **3️⃣ Configure Variables**
Edit `environment/<envirionment>/variables.tf` or create a `terraform.tfvars` file:
```hcl
proxmox_api_url    = "https://your-proxmox-server:8006/"
proxmox_api_token_id  = "your-token-id"
proxmox_api_token_secret   = "your-token-secret"
```

#### **4️⃣ Plan and Apply Changes**
To deploy a VM:
```sh
terraform plan
terraform apply -auto-approve
```

#### **5️⃣ Destroy (Optional)**
```sh
terraform destroy -auto-approve
```

---

### **🖥️ Example Configuration**
```hcl
module "proxmox_vm" {
  source        = "../../modules/proxmox-vm"
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

---

### **🔗 References**
- [Terraform Docs](https://developer.hashicorp.com/terraform/docs)
- [Proxmox API](https://pve.proxmox.com/wiki/Proxmox_VE_API)
