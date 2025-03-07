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

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "todo_lambda"
}

variable "ecr_repository_url" {
  description = "The URL of the ECR repository containing the Lambda function image"
  type        = string
}
