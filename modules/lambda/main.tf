# IAM role for Lambda execution
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_exec" {
  name               = "lambda_execution_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
# Package the Lambda function code
data "archive_file" "photo_compressor_file" {
  type        = "zip"
  source_dir = "${path.module}/function"
  output_path = "${path.module}/photo_compressor.zip"
}

# CloudWatch Logs policy
resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from Lambda"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = ["arn:aws:logs:*:*:*"]
      }
    ]
  })
}

# Attach logging policy to Lambda role
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

resource "aws_lambda_function" "photo_compressor_function" {
  function_name    = "photo_compressor_${var.environment}"
  filename         = data.archive_file.photo_compressor_file.output_path
  handler          = "index.handler"
  runtime          = "nodejs22.x"
  source_code_hash = data.archive_file.photo_compressor_file.output_base64sha256
  role             = aws_iam_role.lambda_exec.arn
  tags = {
    Environment = var.environment
    Application = "photo_compressor_${var.environment}"
  }

  # Advanced logging configuration
  logging_config {
    log_format            = "JSON"
    application_log_level = "INFO"
    system_log_level      = "WARN"
  }

  # Ensure IAM role and log group are ready
  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
  ]
}

# CloudWatch Log Group with retention
resource "aws_cloudwatch_log_group" "photo_compressor_log_group" {
 name              = "/aws/lambda/${aws_lambda_function.photo_compressor_function.function_name}"
  retention_in_days = 14

  depends_on = [
   aws_lambda_function.photo_compressor_function
  ]

  tags = {
    Environment = var.environment
    Project    = "photo_compressor_${var.environment}"
  }
}