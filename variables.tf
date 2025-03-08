variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "project-name" {
  description = "Name of the project"
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


# variable "lambda_role_arn" {
#   description = "The ARN of the IAM Lambda Role"
#   type        = string
# }

variable "ecr_image_uri" {
  description = "The URL of the ECR repository containing the Lambda function image"
  type        = string
  default = "329599632133.dkr.ecr.us-east-1.amazonaws.com/ascan"
}
