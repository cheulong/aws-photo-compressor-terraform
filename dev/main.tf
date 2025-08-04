module "vpc" {
  source      = "../modules/vpc"
  environment = var.environment
  cidr_block  = var.cidr_block
}

module "s3" {
  source      = "../modules/s3"
  environment = var.environment
}

module "dynamodb" {
  source      = "../modules/dynamodb"
  environment = var.environment
}

module "lambda" {
  source = "../modules/lambda"
  environment = var.environment
}

module "amplify_app" {
  source = "../modules/amplify"
  environment = var.environment
}