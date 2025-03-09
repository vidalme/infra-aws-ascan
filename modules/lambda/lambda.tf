resource "aws_lambda_function" "todo_ascan_lambda" {
  function_name = "${var.project-name}-lambda"
  role          = var.lambda_role_arn

  # Use container image instead of zip file
  package_type = "Image"
  image_uri    = var.image_uri_with_tag

  # Not required when using container images
  runtime = null

  environment {
    variables = {
      DYNAMO_TABLE_NAME = var.table_name
    }
  }
}