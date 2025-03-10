variable "project-name" {
  description = "The name of the project"
  type        = string
}
variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}

variable "image_uri_with_tag" {
  description = "The complete URI of the ECR image (e.g., '329599632133.dkr.ecr.us-east-1.amazonaws.com/ascan:latest')"
  type        = string
}

variable "lambda_role_arn" {
  description = "Arn of the IAM role for the Lambda function"
  type        = string
}

variable "table_name" {
  description = "The name of the dynamodb table, it must be passed as env var in the lambda function"
  type        = string
}
