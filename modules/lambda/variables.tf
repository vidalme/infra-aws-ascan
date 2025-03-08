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

variable "ecr_image_uri" {
  description = "The complete URI of the ECR image (e.g., '329599632133.dkr.ecr.us-east-1.amazonaws.com/ascan:latest')"
  type        = string
}

variable "lambda_role_arn" {
  description = "Arn of the IAM role for the Lambda function"
  type        = string
}
