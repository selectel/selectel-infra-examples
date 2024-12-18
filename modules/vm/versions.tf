terraform {
  required_providers {
    selectel = {
      source  = "registry.terraform.io/selectel/selectel"
      version = "~> 6.0.0"
    }
    openstack = {
      source  = "registry.terraform.io/terraform-provider-openstack/openstack"
      version = "~> 3.0.0"
    }
  }
}
