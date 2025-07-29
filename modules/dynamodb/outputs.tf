output "dynamodb_name" {
  value = aws_dynamodb_table.compressed_photo_history.tags["Project"]
}

output "dynamodb_id" {
  value = aws_dynamodb_table.compressed_photo_history.id
}