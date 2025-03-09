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

# IAM module depends on DynamoDB module (IAM expects the table ARN as input)
module "iam" {
  source       = "./modules/iam"
  project-name = var.project-name
  tags         = var.tags
  # Pass the DynamoDB table ARN to the IAM module
  dynamodb_table_arn = module.dynamodb.table_arn
}

module "lambda" {
  source       = "./modules/lambda"
  project-name = var.project-name
  environment  = var.environment
  tags         = var.tags
  # IAM role ARN that lambda will use  
  lambda_role_arn = module.iam.lambda_role_arn
  # Name of the dynamodb table defined in Lambda environment variables
  table_name = module.dynamodb.table_name
  # ECR image URI used by lambda function (it comes from the CI/CD pipeline that builds the image)
  image_uri_with_tag = var.image_uri_with_tag
}