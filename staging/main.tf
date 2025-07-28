

module "vpc" {
  source      = "../modules/vpc"
  environment = var.environment
  cidr_block  = var.cidr_block
}

# Output the VPC ID