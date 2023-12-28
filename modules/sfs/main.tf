resource "openstack_sharedfilesystem_sharenetwork_v2" "sfs_sharenetwork" {
  name              = "${var.sfs_name_prefix}-sfs-sharenetwork"
  description       = "${var.sfs_name_prefix}-sfs-sharenetwork"
  neutron_net_id    = var.os_network_id
  neutron_subnet_id = var.os_subnet_id
}

resource "openstack_sharedfilesystem_share_v2" "sfs_share" {
  name             = "${var.sfs_name_prefix}-${var.sfs_proto}-sfs-share"
  size             = var.sfs_size
  share_proto      = var.sfs_proto
  share_type       = "${var.sfs_volume_type}.${var.os_availability_zone}"
  share_network_id = openstack_sharedfilesystem_sharenetwork_v2.sfs_sharenetwork.id
}

resource "openstack_sharedfilesystem_share_access_v2" "share_access_1" {
  share_id     = openstack_sharedfilesystem_share_v2.sfs_share.id
  access_type  = "ip"
  access_to    = var.nat_subnet_cidr
  access_level = "rw"
}
