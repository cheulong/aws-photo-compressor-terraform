terraform {
  backend "s3" {
    bucket = "cheulong-devops-terraform-state-kljbxs"
    key    = "aws-photo-compressor/dev/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
    }
}