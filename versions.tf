terraform {
  required_providers {
    selectel = {
      source  = "selectel/selectel"
      version = "5.1.1"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.53.0"
    }
  }
  backend "s3" {
    endpoint = "s3.ru-1.storage.selcloud.ru"
  }
  required_version = ">= 1.0.0"
}
