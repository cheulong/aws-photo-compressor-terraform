# Create an S3 bucket for Terraform remote state storage
resource "aws_dynamodb_table" "compressed_photo_history" {
  name         = "compressed_photo_history_${var.environment}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "photo_id"
  attribute {
    name = "photo_id"
    type = "S"
  }
  tags = {
    Description = "Compressed Photo History Table"
    Environment = var.environment
    Project     = "AWS Photo Compressor"
  }
}
