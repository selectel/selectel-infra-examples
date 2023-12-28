data "openstack_images_image_v2" "image_1" {
  name        = var.image_name
  visibility  = var.image_visibility
  most_recent = true
}

resource "random_string" "random" {
  length  = 16
  special = false
}

resource "openstack_blockstorage_volume_v3" "volume_1" {
  name              = random_string.random.result
  size              = var.server_root_disk_gb
  image_id          = data.openstack_images_image_v2.image_1.id
  volume_type       = "${var.server_volume_type}.${var.os_zone}"
  availability_zone = var.os_zone

  lifecycle {
    ignore_changes = [image_id]
  }
}
