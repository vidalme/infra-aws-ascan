resource "aws_dynamodb_table" "todo-ascan-dynamodb" {
  name           = "${var.project-name}-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"

  attribute {
    name = "id"
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
  "id": {"N": "1"},
  "title": {"S": "Learn Python"},
  "done": {"BOOL": false},
  "priority": {"N": "2"}
}
ITEM
}

resource "aws_dynamodb_table_item" "todo-ascan-dynamodb-item-2" {
  table_name = aws_dynamodb_table.todo-ascan-dynamodb.name
  hash_key   = aws_dynamodb_table.todo-ascan-dynamodb.hash_key

  item = <<ITEM
{
  "id": {"N": "2"},
  "title": {"S": "Learn Terraform"},
  "done": {"BOOL": false},
  "priority": {"N": "3"}
}
ITEM
}

resource "aws_dynamodb_table_item" "todo-ascan-dynamodb-item-3" {
  table_name = aws_dynamodb_table.todo-ascan-dynamodb.name
  hash_key   = aws_dynamodb_table.todo-ascan-dynamodb.hash_key

  item = <<ITEM
{
  "id": {"N": "3"},
  "title": {"S": "Learn AWS"},
  "done": {"BOOL": false},
  "priority": {"N": "1"}
}
ITEM
}


