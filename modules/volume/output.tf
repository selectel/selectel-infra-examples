output "image_id" {
  value       = data.openstack_images_image_v2.image_1.id
  description = "ID of image used"
}

output "volume_id" {
  value       = openstack_blockstorage_volume_v3.volume_1.id
  description = "Created volume ID"
}

output "volume_name" {
  value       = random_string.random.result
  description = "Name of created volume"
}