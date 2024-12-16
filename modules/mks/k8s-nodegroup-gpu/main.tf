resource "selectel_mks_nodegroup_v1" "nodegroup_1" {
  cluster_id        = var.cluster_id
  project_id        = var.os_project_id
  region            = var.os_region
  availability_zone = var.availability_zone
  nodes_count       = var.nodes_count
  keypair_name      = var.keypair_name
  affinity_policy   = var.affinity_policy
  volume_gb         = var.volume_gb
  volume_type       = var.volume_type
  labels            = var.labels
  flavor_id         = var.flavor_id

  install_nvidia_device_plugin = true

  dynamic "taints" {
    for_each = var.taints[*]
    content {
      key    = taints.value["key"]
      value  = taints.value["value"]
      effect = taints.value["effect"]
    }
  }
}
