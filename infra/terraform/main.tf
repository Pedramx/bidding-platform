# infra/terraform/main.tf
terraform {
  required_version = ">= 1.2.0"
  required_providers {
    # Example: we might add AWS, Azure, GCP providers in the future
  }
}

provider "aws" {
  # placeholder - or remove if not needed yet
  region = "us-east-1"
}
