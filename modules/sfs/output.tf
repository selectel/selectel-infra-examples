output "sfs_address" {
  value       = openstack_sharedfilesystem_share_v2.sfs_share.export_locations[0].path
  description = "SFS path"
}

output "sfs_addressess" {
  value       = openstack_sharedfilesystem_share_v2.sfs_share.export_locations
  description = "SFS paths array. For debug purposes"
}