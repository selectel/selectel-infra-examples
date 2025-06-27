terraform {
  required_providers {
    selectel = {
      source  = "registry.terraform.io/selectel/selectel"
      version = "6.5.0"
    }
    openstack = {
      source  = "registry.terraform.io/terraform-provider-openstack/openstack"
      version = "3.2.0"
    }
  }
  backend "s3" {
    endpoints                   = { s3 = "https://s3.ru-1.storage.selcloud.ru" }
    region                      = "ru-1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    skip_metadata_api_check     = true
  }
}
