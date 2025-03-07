resource "aws_iam_role_policy" "lambda_rds_policy" {
  name = "${var.lambda_function_name}_rds_policy"
  role = module.lambda.aws_iam_role.lambda_exec_role.id
  # role = aws_iam_role.lambda_exec_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "rds:Connect",
          "rds:DescribeDBInstances",
          "rds:DescribeDBClusters"
        ]
        Effect   = "Allow"
        Resource = var.rds_arn
      }
    ]
  })
}
