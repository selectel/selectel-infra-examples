resource "selectel_mks_cluster_v1" "cluster_1" {
  name                              = var.cluster_name
  project_id                        = var.os_project_id
  region                            = var.os_region
  kube_version                      = var.kube_version
  enable_autorepair                 = var.enable_autorepair
  enable_patch_version_auto_upgrade = var.enable_patch_version_auto_upgrade
  network_id                        = var.os_network_id
  subnet_id                         = var.os_subnet_id
  maintenance_window_start          = var.maintenance_window_start
}
