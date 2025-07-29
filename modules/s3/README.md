## S3 Module

### Inputs
- `environment` (string): environment tag for the VPC

### Outputs
- `s3_id`: The ID of the created S3 bucket
- `s3_name`: The name tag of the created S3 bucket

### Example usage:

```hcl
module "vpc" {
  source = "../modules/s3"
  environment   = "dev"
}
