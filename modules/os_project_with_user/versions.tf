terraform {
  required_providers {
    selectel = {
      source  = "selectel/selectel"
      version = ">=5.1.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.3.2"
    }
  }
  required_version = ">= 1.0.0, <= 1.6.2"
}
