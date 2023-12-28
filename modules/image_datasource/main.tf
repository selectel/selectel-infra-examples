data "openstack_images_image_v2" "image_1" {
  name        = var.image_name
  most_recent = var.most_recent
  region      = var.os_region
}
