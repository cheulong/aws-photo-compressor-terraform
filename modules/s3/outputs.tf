output "s3_name" {
  value = aws_s3_bucket.photo_bucket.tags["Name"]
}

output "s3_id" {
  value = aws_s3_bucket.photo_bucket.id
}