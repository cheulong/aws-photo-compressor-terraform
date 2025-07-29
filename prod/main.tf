module "vpc" {
  source      = "../modules/vpc"
  environment = var.environment
  cidr_block  = var.cidr_block
}

module "s3" {
  source = "../modules/s3"
  environment = var.environment
}
#