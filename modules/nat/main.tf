data "openstack_networking_network_v2" "external_net" {
  name     = var.router_external_net_name
  external = true
}

resource "openstack_networking_router_v2" "router_1" {
  external_network_id = data.openstack_networking_network_v2.external_net.id
  name                = var.router_name
}

resource "openstack_networking_network_v2" "network_1" {
  name = var.network_name
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  network_id      = openstack_networking_network_v2.network_1.id
  dns_nameservers = var.dns_nameservers
  cidr            = var.subnet_cidr
  name            = var.subnet_cidr
  enable_dhcp     = var.enable_dhcp
  no_gateway      = var.no_gateway
}

resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_1.id
}
