# Terraform

## Overview

This is a Terraform project that creates a resources for AWS Photo Compressor.

## Usage

To use this project, follow these steps:

1. Clone the repository to your local machine.
2. Open the `terraform` directory in your terminal.
3. Initialize Terraform by running `terraform init`.
4. Nevigate into the `dev` directory and run `terraform plan -out=tfplan -var-file=variables.tfvars` to create a plan.
5. If the plan looks good, run `terraform apply tfplan` to apply the plan.

#### Example
```bash
git clone https://github.com/aws-samples/aws-photo-compressor-terraform.git

cd aws-photo-compressor-terraform
terraform init
```

```yaml
# ./dev

terraform plan -out=tfplan -var-file=variables.tfvars

terraform apply tfplan
```

## Resources

### VPC

This module creates a VPC with a public and private subnet in two availability zones.