terraform {
  backend "s3" {
    bucket = "cheulong-devops-terraform-state-zuqxq2"
    key    = "aws-photo-compressor/dev/terraform.tfstate"
    region = "ap-southeast-1"
    use_lockfile = true
    encrypt = true
    }
}