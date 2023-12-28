output "keypair_id" {
  value       = openstack_compute_keypair_v2.keypair_1.id
  description = "ID созданной KeyPair"
}

output "keypair_name" {
  value       = openstack_compute_keypair_v2.keypair_1.name
  description = "Имя созданной KeyPair"
}
