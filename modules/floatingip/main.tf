resource "openstack_networking_floatingip_v2" "floatingip_1" {
  pool   = var.pool
  region = var.region
}
