terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }


}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}



module "vpc" {
  source      = "../modules/vpc"
  environment = var.environment
  cidr_block  = var.cidr_block
}
