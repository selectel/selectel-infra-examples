terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.53.0"
    }
  }
  required_version = ">= 1.0.0, <= 1.6.2"
}
