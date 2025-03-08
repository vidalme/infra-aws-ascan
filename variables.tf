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
    "Owner"       = "ascaiano"
    "Project"     = "todo-ascan"
    "Environment" = "dev"
  }
}


# variable "lambda_role_arn" {
#   description = "The ARN of the IAM Lambda Role"
#   type        = string
# }

# variable "ecr_image_uri" {
#   description = "The URL of the ECR repository containing the Lambda function image"
#   type        = string
#   # No default - will use TF_VAR_ecr_image_uri environment variable if set
#   # default     = "329599632133.dkr.ecr.us-east-1.amazonaws.com/ascan:latest"
# }

variable "image_uri_with_tag" {
  description = "The Docker image tag to use"
  type        = string
  default     = "329599632133.dkr.ecr.us-east-1.amazonaws.com/ascan:latest"
}