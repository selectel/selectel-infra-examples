terraform {
  required_providers {
    openstack = {
      source  = "registry.terraform.io/terraform-provider-openstack/openstack"
      version = "1.53.0"
    }
    http-full = {
      source  = "registry.terraform.io/salrashid123/http-full"
      version = ">= 1.3.1"
    }

    terracurl = {
      source  = "registry.terraform.io/devops-rob/terracurl"
      version = ">= 1.0.1"
    }
  }
}
