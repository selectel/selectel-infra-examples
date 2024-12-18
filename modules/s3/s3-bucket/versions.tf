terraform {
  required_providers {
    openstack = {
      source  = "registry.terraform.io/terraform-provider-openstack/openstack"
      version = "~> 3.0.0"
    }
    http-full = {
      source  = "registry.terraform.io/salrashid123/http-full"
      version = "~> 1.3.0"
    }
    terracurl = {
      source  = "registry.terraform.io/devops-rob/terracurl"
      version = "~> 1.2.0"
    }
  }
}
