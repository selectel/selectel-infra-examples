module "nat" {
  source      = "../../nat"
  subnet_cidr = var.nat_subnet_cidr
  router_name = "${var.cluster_name}-router"
  no_gateway  = var.no_gateway
}

module "kubernetes_cluster" {
  source = "../k8s-cluster"

  cluster_name                      = var.cluster_name
  os_project_id                     = var.os_project_id
  os_region                         = var.os_region
  kube_version                      = var.kube_version
  enable_autorepair                 = var.enable_autorepair
  enable_patch_version_auto_upgrade = var.enable_patch_version_auto_upgrade
  os_network_id                     = module.nat.network_id
  os_subnet_id                      = module.nat.subnet_id
  maintenance_window_start          = var.maintenance_window_start
}

# Create nodegroup
module "kubernetes_nodegroup" {
  source = "../k8s-nodegroup"

  count = var.nodegroups

  cluster_id        = module.kubernetes_cluster.cluster_id
  os_project_id     = var.os_project_id
  os_region         = var.os_region
  availability_zone = var.os_availability_zone
  nodes_count       = var.ng_nodes_count[count.index]
  keypair_name      = var.ng_keypair_name
  affinity_policy   = var.ng_affinity_policy
  cpus              = var.ng_cpus[count.index]
  ram_mb            = var.ng_ram_mb[count.index]
  volume_gb         = var.ng_volume_gb[count.index]
  labels            = var.ng_labels[count.index]
  taints            = var.ng_taints
  volume_type       = "${var.ng_volume_type[count.index]}.${var.os_availability_zone}"

  depends_on = [
    module.kubernetes_cluster
  ]
}

module "kubernetes_nodegroup_gpu" {
  source = "../k8s-nodegroup-gpu"

  count = var.gpu_nodegroups

  cluster_id        = module.kubernetes_cluster.cluster_id
  os_project_id     = var.os_project_id
  os_region         = var.os_region
  availability_zone = var.os_availability_zone
  nodes_count       = var.gpu_ng_nodes_count[count.index]
  keypair_name      = var.ng_keypair_name
  affinity_policy   = var.ng_affinity_policy
  volume_gb         = var.gpu_ng_volume_gb[count.index]
  labels            = var.gpu_ng_labels[count.index]
  taints            = var.gpu_ng_taints
  flavor_id         = var.gpu_ng_flavor[count.index]
  volume_type       = "${var.gpu_ng_volume_type[count.index]}.${var.os_availability_zone}"

  depends_on = [
    module.kubernetes_cluster
  ]
}

data "selectel_mks_kubeconfig_v1" "kubeconfig" {
  cluster_id = module.kubernetes_cluster.cluster_id
  project_id = var.os_project_id
  region     = var.os_region
}
