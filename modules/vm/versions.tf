terraform {
  required_providers {
    selectel = {
      source  = "registry.terraform.io/selectel/selectel"
      version = ">=5.0.2"
    }
    openstack = {
      source  = "registry.terraform.io/terraform-provider-openstack/openstack"
      version = "1.53.0"
    }
  }
  required_version = ">= 1.0.0, <= 1.6.2"
}
