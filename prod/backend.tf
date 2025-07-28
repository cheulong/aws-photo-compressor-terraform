terraform {
    backend "s3" {
    bucket       = "cheulong-devops-terraform-state-6zshsv"
    key          = "aws-photo-compressor/prod/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}