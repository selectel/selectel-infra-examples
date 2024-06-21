terraform {
  required_providers {
    selectel = {
      source  = "registry.terraform.io/selectel/selectel"
      version = ">=5.0.2"
    }
    random = {
      source  = "registry.terraform.io/hashicorp/random"
      version = ">= 3.3.2"
    }
  }
  required_version = ">= 1.5.0"
}
