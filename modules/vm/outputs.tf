output "nat_net_id" {
  value = module.nat.network_id
}

output "nat_sub_id" {
  value = module.nat.subnet_id
}

output "vm_port_id" {
  value = openstack_networking_port_v2.port_1.id
}