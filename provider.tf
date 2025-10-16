terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0" # or latest version
    }
  }
}


provider "aws" {
  region = var.aws_region
  # Do NOT include access_key or secret_key
}
