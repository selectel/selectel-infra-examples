terraform {
  required_providers {
    selectel = {
      source  = "selectel/selectel"
      version = "5.0.2"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.53.0"
    }
  }
  backend "http" {}
  required_version = ">= 1.0.0"
}
