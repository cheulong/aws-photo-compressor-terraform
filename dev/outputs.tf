output "vpc_id" {
  value = module.vpc.vpc_id
}

output "s3_id" {
  value = module.s3.s3_id
}

output "dynamodb_id" {
  value = module.dynamodb.dynamodb_id
}

output "lambda_id" {
  value = module.lambda.lambda_id
}