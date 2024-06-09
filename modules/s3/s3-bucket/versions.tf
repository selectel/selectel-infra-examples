terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.53.0"
    }
    http-full = {
      source  = "salrashid123/http-full"
      version = ">= 1.3.1"
    }

    terracurl = {
      source  = "devops-rob/terracurl"
      version = ">= 1.0.1"
    }
  }
  required_version = ">= 1.0.0, <= 1.6.2"
}
