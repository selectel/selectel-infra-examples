output "nat1_net_id" {
  value = module.nat1.network_id
}

output "nat1_sub_id" {
  value = module.nat1.subnet_id
}

output "vm1_port_id" {
  value = openstack_networking_port_v2.port_1.id
}

output "nat2_net_id" {
  value = module.nat2.network_id
}

output "nat2_sub_id" {
  value = module.nat2.subnet_id
}

output "vm2_port_id" {
  value = openstack_networking_port_v2.port_2.id
}
