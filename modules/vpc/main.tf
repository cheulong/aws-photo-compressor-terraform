
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

   tags = {
    Environment = var.environment
    Name        = "VPC-${var.environment}"
  }
}