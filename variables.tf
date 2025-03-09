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

variable "image_uri_with_tag" {
  description = "The complete URI of the ECR image (e.g., '329599632133.dkr.ecr.us-east-1.amazonaws.com/ascan:latest')"
  type        = string
  default     = "329599632133.dkr.ecr.us-east-1.amazonaws.com/ascan:latest"  # Use an appropriate default value
}