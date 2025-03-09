variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project-name" {
  description = "Name of the project"
  type        = string
  default     = "todo-ascan"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    "Owner"       = "ascaniano"
    "Project"     = "todo-ascan"
    "Environment" = "dev"
  }
}

variable "image_uri_with_tag" {
  description = "The complete URI of the ECR image (e.g., '329599632133.dkr.ecr.us-east-1.amazonaws.com/ascan:latest')"
  type        = string
  # This can or/and will be overwritten by the CI/CD pipeline
  default = "329599632133.dkr.ecr.us-east-1.amazonaws.com/ascan:latest"
}

variable "table_name" {
  description = "The name of the dynamodb table, it must be passed as env var in the lambda function"
  type        = string
  # This can or/and will be overwritten by the CI/CD pipeline
  default = "todo-ascan-table"
}