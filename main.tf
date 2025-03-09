terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.89.0"
    }
  }
  backend "s3" {
    bucket  = "todo-ascan-bucket"
    key     = "terraform.tfstate" # Unique path for each project
    region  = "us-east-1"
    encrypt = true
    # dynamodb_table = "terraform-lock-table"  # Replace with your DynamoDB table name
  }
}
provider "aws" {
  region = var.region
}

# Dynamodb module must output the table ARN
module "dynamodb" {
  source       = "./modules/dynamodb"
  project-name = var.project-name
  environment  = var.environment
  tags         = var.tags
}

# IAM module with Lambda role for DynamoDB access
module "iam" {
  source = "./modules/iam"

  project-name = var.project-name
  tags         = var.tags

  # Pass the DynamoDB table ARN to the IAM module
  dynamodb_table_arn = module.dynamodb.table_arn
}

# Lambda module using the IAM role
module "lambda" {
  source = "./modules/lambda"

  project-name = var.project-name
  environment  = var.environment
  tags         = var.tags

  # Pass the IAM role ARN and DynamoDB table name to the Lambda module  
  lambda_role_arn = module.iam.lambda_role_arn

  # Pass the name of the dynamodb table to the Lambda environment variables
  table_name = module.dynamodb.table_name

  # Pass the ECR image URI to the Lambda module (it comes from the CI/CD pipeline that builds the image)
  image_uri_with_tag = var.image_uri_with_tag
}