module "os-flavor" {
  source = "../flavor"

  flavor_name          = var.vm_name
  flavor_vcpus         = var.vm_vcpus
  flavor_ram_mb        = var.vm_ram_mb
  flavor_local_disk_gb = var.vm_local_disk_gb
  os_region            = var.os_region
}

module "volume" {
  source = "../volume"

  count               = length(var.server_root_disk_gb)
  server_root_disk_gb = var.server_root_disk_gb[count.index]
  server_volume_type  = var.server_volume_type[count.index]
  os_zone             = var.os_zone
  image_name          = var.image_name[count.index]
}

module "nat1" {
  source = "../nat"

  router_external_net_name = var.router_external_net_name
  dns_nameservers          = var.dns_nameservers
  subnet_cidr              = var.subnet_cidr
  router_name              = var.router1_name
  network_name             = var.network1_name
  enable_dhcp              = var.enable_dhcp
}

module "nat2" {
  source = "../nat"

  router_external_net_name = var.router_external_net_name
  dns_nameservers          = var.dns_nameservers
  subnet_cidr              = var.subnet_cidr
  router_name              = var.router2_name
  network_name             = var.network2_name
  enable_dhcp              = var.enable_dhcp
}

resource "openstack_networking_port_v2" "port_1" {
  name       = "${var.vm_name}-eth0"
  network_id = module.nat1.network_id

  fixed_ip {
    subnet_id = module.nat1.subnet_id
  }
}

resource "openstack_networking_port_v2" "port_2" {
  name       = "${var.vm_name}-eth1"
  network_id = module.nat2.network_id

  fixed_ip {
    subnet_id = module.nat2.subnet_id
  }
}

resource "openstack_compute_instance_v2" "instance_1" {
  name = var.vm_name

  flavor_id         = module.os-flavor.flavor_id
  availability_zone = var.os_zone

  network {
    port = openstack_networking_port_v2.port_1.id
  }

  network {
    port = openstack_networking_port_v2.port_2.id
  }

  dynamic "block_device" {
    for_each = module.volume
    content {
      source_type      = "volume"
      destination_type = "volume"
      uuid             = block_device.value.volume_id
      boot_index       = block_device.key
    }
  }

  vendor_options {
    ignore_resize_confirmation = true
  }

  lifecycle {
    ignore_changes = [
      key_pair,
    ]
  }
}
