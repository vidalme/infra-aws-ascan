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
module "dynamodb" {
  source       = "./modules/dynamodb"
  project-name = var.project-name
  environment  = var.environment
  tags         = var.tags
}
module "lambda" {
  source        = "./modules/lambda"
  ecr_image_uri = var.ecr_image_uri
  project-name  = var.project-name
  environment   = var.environment
  tags          = var.tags
}
# module "iam" {
#   source = "./modules/iam"

#   lambda_function_name = var.lambda_function_name
#   rds_arn              = module.rds.rds_arn
# }