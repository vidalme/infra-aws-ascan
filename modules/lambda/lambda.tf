
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "todo_ascan_iam_for_lambda" {
  name               = "${project-name}-iam-lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${var.project-name}-lambda.js"
  output_path = "${var.project-name}-lambda_payload.zip"
}

resource "aws_lambda_function" "todo_ascan_lambda" {
  
  filename      = "${var.project-name}-lambda_payload.zip"
  function_name = "${var.project-name}-lambda"
  role          = aws_iam_role.todo_ascan_iam_for_lambda.arn
  handler       = "todo-ascan-lambda.handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "nodejs18.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}