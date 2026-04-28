terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}

resource "random_string" "random" {
  keepers = {
    jwt_secret_length = 12
  }

  length           = 12
  special          = true
  override_special = "/@£$"
}
