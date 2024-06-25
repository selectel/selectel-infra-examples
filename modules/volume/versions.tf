terraform {
  required_providers {
    openstack = {
      source  = "registry.terraform.io/terraform-provider-openstack/openstack"
      version = "1.53.0"
    }
    random = {
      source  = "registry.terraform.io/hashicorp/random"
      version = ">= 3.3.2"
    }
  }
  required_version = ">= 1.0.0, <= 1.6.2"
}
