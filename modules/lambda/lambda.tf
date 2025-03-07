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
  name               = "${var.project-name}-iam-lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_lambda_function" "todo_ascan_lambda" {
  function_name = "${var.project-name}-lambda"
  role          = aws_iam_role.todo_ascan_iam_for_lambda.arn
  
  # Use container image instead of zip file
  package_type  = "Image"
  image_uri     = "${var.ecr_repository_url}:${var.image_tag}"
  
  # No handler needed for container images
  
  runtime = null # Not required when using container images

  environment {
    variables = {
      foo = "bar"
    }
  }
}