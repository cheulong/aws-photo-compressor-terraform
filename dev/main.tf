terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "cheulong-devops-terraform-state-kljbxs"
    key          = "aws-photo-compressor/dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
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
