provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source      = "../modules/vpc"
  environment = var.environment
  cidr_block  = var.cidr_block
}

