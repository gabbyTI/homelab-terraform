locals {
  talos_nodes = {
    "talos-master-01" = { role = "control-plane", target_node = "pve" },
    "talos-worker-01" = { role = "worker", target_node = "pve" },
    "talos-worker-02" = { role = "worker", target_node = "pve" }
  }
}
