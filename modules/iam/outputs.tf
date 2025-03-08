output "lambda_role_arn" {
  description = "The ARN of the Lambda execution role"
  value       = aws_iam_role.todo_ascan_iam_for_lambda.arn
}