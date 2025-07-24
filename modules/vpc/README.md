## VPC Module

### Inputs
- `cidr` (string): CIDR block for the VPC
- `environment` (string): environment tag for the VPC

### Outputs
- `vpc_id`: The ID of the created VPC
- `vpc_name`: The name tag of the created VPC

### Example usage:

```hcl
module "vpc" {
  source = "../modules/vpc"
  cidr   = "10.0.0.0/16"
  environment   = "dev"
}
