terraform {
  required_providers {
    selectel = {
      source  = "selectel/selectel"
      version = ">=5.0.2"
    }
    random = {
      source  = "registry.terraform.io/hashicorp/random"
      version = ">= 3.3.2"
    }
  }
}
