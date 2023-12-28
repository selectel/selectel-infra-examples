output "kube_config" {
  value     = data.selectel_mks_kubeconfig_v1.kubeconfig
  sensitive = true
}

output "nat_network_id" {
  value = module.nat.network_id
}

output "nat_subnet_id" {
  value = module.nat.subnet_id
}
