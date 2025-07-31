# Create an S3 bucket for Terraform remote state storage
resource "aws_s3_bucket" "photo_bucket" {
  bucket        = "cheulong-aws-photo-compressor-${var.environment}"
  tags = {
    Name = "Bucket for original and compressed images"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_ownership_controls" "photo_bucket_ownership_controls" {
  bucket = aws_s3_bucket.photo_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "photo_bucket_public_access_block" {
  bucket = aws_s3_bucket.photo_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "photo_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.photo_bucket_ownership_controls,
    aws_s3_bucket_public_access_block.photo_bucket_public_access_block,
  ]

  bucket = aws_s3_bucket.photo_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "photo_bucket_encryption" {
  bucket = aws_s3_bucket.photo_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "photo_bucket_lifecycle" {
  bucket = aws_s3_bucket.photo_bucket.id

  rule {
    id     = "delete_old_images"
    status = "Enabled"
    filter {}

    expiration {
      days = 14
    }
  }
}