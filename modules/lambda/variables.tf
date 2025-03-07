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
variable "ecr_repository_url" {
  description = "The URL of the ECR repository containing the Lambda function image"
  type        = string
}
variable "image_tag" {
  description = "The image tag to use for the Lambda function"
  type        = string
  default     = "latest"
}
