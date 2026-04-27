terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}

resource "random_bytes" "jwt_secret" {
  length = 14
}

resource "random_string" "random" {
  keepers = {
    jwt_secret_length = 13
  }

  length           = resource.random_bytes.jwt_secret.length
  special          = true
  override_special = "/@£$"
}
