terraform {
  required_providers {
    selectel = {
      source  = "registry.terraform.io/selectel/selectel"
      version = "5.1.1"
    }
    openstack = {
      source  = "registry.terraform.io/terraform-provider-openstack/openstack"
      version = "1.53.0"
    }
  }
  backend "s3" {}
  required_version = ">= 1.0.0, <= 1.6.2"
}
