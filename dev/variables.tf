variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "The environment for the VPC (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Invalid environment name. Valid options are dev, staging, and prod."
  }
}