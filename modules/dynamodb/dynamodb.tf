resource "aws_dynamodb_table" "todo-ascan-dynamodb" {
  name           = "${var.project-name}-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "TaskId"

  attribute {
    name = "TaskId"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }

  tags = merge(var.tags, {
    Name        = "${var.project-name}-dynamodb-table",
    Environment = var.environment
  })
}

resource "aws_dynamodb_table_item" "todo-ascan-dynamodb-item-1" {
  table_name = aws_dynamodb_table.todo-ascan-dynamodb.name
  hash_key   = aws_dynamodb_table.todo-ascan-dynamodb.hash_key

  item = <<ITEM
{
  "TaskId": {"N": "1"},
  "Task": {"S": "Learn Python"},
  "Done": {"BOOL": false},
  "Priority": {"N": "2"}
}
ITEM
}

resource "aws_dynamodb_table_item" "todo-ascan-dynamodb-item-2" {
  table_name = aws_dynamodb_table.todo-ascan-dynamodb.name
  hash_key   = aws_dynamodb_table.todo-ascan-dynamodb.hash_key

  item = <<ITEM
{
  "TaskId": {"N": "2"},
  "Task": {"S": "Learn Terraform"},
  "Done": {"BOOL": false},
  "Priority": {"N": "3"}
}
ITEM
}

resource "aws_dynamodb_table_item" "todo-ascan-dynamodb-item-3" {
  table_name = aws_dynamodb_table.todo-ascan-dynamodb.name
  hash_key   = aws_dynamodb_table.todo-ascan-dynamodb.hash_key

  item = <<ITEM
{
  "TaskId": {"N": "3"},
  "Task": {"S": "Learn AWS"},
  "Done": {"BOOL": false},
  "Priority": {"N": "1"}
}
ITEM
}


