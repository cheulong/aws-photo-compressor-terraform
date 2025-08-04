# Create an Amplify App
resource "aws_amplify_app" "photo_compressor" {
  name         = "photo_compressor_${var.environment}"
  repository   = "https://gitlab.com/cheulong-devops/aws-photo-compressor/frontend.git"
  access_token = "..." # Replace with your GitLab access token
  build_spec   = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - npm ci --cache .npm --prefer-offline
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: dist
        files:
          - '**/*'
      cache:
        paths:
          - .npm/**/*
  EOT
  # Enable auto branch creation for the Amplify App.
  enable_auto_branch_creation = true
  enable_branch_auto_deletion = true
  # The default patterns added by the Amplify Console.
  auto_branch_creation_patterns = [
    "*",
    "*/**",
  ]

  auto_branch_creation_config {
    # Enable auto build for the created branch.
    enable_auto_build = true
  }



  environment_variables = {
    ENV = var.environment
    "_LIVE_UPDATES" = jsonencode(
      [
        {
          name    = "Node.js version"
          pkg     = "node"
          type    = "nvm"
          version = "22"
        },
      ]
    )
  }
}

# Create an Amplify Branch
resource "aws_amplify_branch" "photo_compressor_branch" {
  app_id      = aws_amplify_app.photo_compressor.id
  branch_name = "main"

  framework = "React"
  stage     = "PRODUCTION"

  enable_basic_auth      = true
  basic_auth_credentials = base64encode("admin:password")
}

