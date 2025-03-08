

resource "aws_lambda_function" "todo_ascan_lambda" {
  function_name = "${var.project-name}-lambda"
  role          = var.lambda_role_arn

  # Use container image instead of zip file
  package_type = "Image"
  image_uri    = var.image_uri_with_tag # Use a complete, valid ECR URI

  runtime = null # Not required when using container images

  environment {
    variables = {
      foo = "bar"
    }
  }
}