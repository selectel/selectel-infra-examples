resource "openstack_networking_network_v2" "network_1" {
  name = var.network_name
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  network_id  = openstack_networking_network_v2.network_1.id
  name        = var.subnet_cidr
  cidr        = var.subnet_cidr
  enable_dhcp = var.enable_dhcp
  no_gateway  = var.no_gateway
}