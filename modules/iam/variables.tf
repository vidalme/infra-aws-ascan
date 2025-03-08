# variable "lambda_function_name" {
#   description = "The name of the Lambda function"
#   type        = string
# }

# variable "lambda_role_id" {
#   description = "The ID of the IAM role used by the Lambda function"
#   type        = string
# }

# variable "dynamodb_arn" {
#   description = "The ARN of the DynamoDB table"
#   type        = string
# }

variable "project-name" {
  description = "Name of the project"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table created in a different module"
  type        = string
}