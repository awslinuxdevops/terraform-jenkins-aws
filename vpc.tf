# Provider

provider "aws" {
  region = var.region
}


data "aws_vpc" "existing" {
  id = "vpc-0bd2488ba2e3db174"
}

