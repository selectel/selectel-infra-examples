terraform {
  required_providers {
    selectel = {
      source  = "registry.terraform.io/selectel/selectel"
      version = "6.0.1"
    }
    openstack = {
      source  = "registry.terraform.io/terraform-provider-openstack/openstack"
      version = "3.0.0"
    }
  }
  backend "s3" {
    endpoints = {
      s3 = "s3.ru-1.storage.selcloud.ru"
    }
  }
}
