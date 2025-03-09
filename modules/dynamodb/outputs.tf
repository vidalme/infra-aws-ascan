output "table_arn" {
  description = "The ARN of the DynamoDB table"
  value       = aws_dynamodb_table.todo-ascan-dynamodb.arn
}

output "table_name" {
  description = "The name of the DynamoDB table"
  value       = aws_dynamodb_table.todo-ascan-dynamodb.name
}
