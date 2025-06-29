terraform {
  required_providers {
    openstack = {
      source  = "registry.terraform.io/terraform-provider-openstack/openstack"
      version = "~> 3.0"
    }
    random = {
      source  = "registry.terraform.io/hashicorp/random"
      version = "~> 3.0"
    }
  }
}
