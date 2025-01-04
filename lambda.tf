locals {
  lambda_source_dir = "${path.module}/resources/lambdas"
  zipped_lambda_dir = "${path.module}/zipped"
}

resource "aws_iam_role" "lambda_iam_role" {
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

data "archive_file" "lambda_get_customers_zip" {
  type        = "zip"
  source_dir  = "${local.lambda_source_dir}/GetCustomers/build"
  output_path = "${local.zipped_lambda_dir}/GetCustomers.zip"
}

resource "aws_lambda_function" "get_customers" {
  function_name    = "getCustomers"
  role             = aws_iam_role.lambda_iam_role.arn
  runtime          = "nodejs18.x"
  handler          = "index.handler"
  filename         = data.archive_file.lambda_get_customers_zip.output_path
  source_code_hash = data.archive_file.lambda_get_customers_zip.output_base64sha256
}

resource "null_resource" "sam_metadata_aws_lambda_function_get_customers" {
  triggers = {
    resource_name        = "aws_lambda_function.get_customers"
    resource_type        = "ZIP_LAMBDA_FUNCTION"
    original_source_code = "${local.lambda_source_dir}/GetCustomers/build"
    built_output_path    = "${local.zipped_lambda_dir}/GetCustomers.zip"
  }
}

data "archive_file" "lambda_get_orders_zip" {
  type        = "zip"
  source_dir  = "${local.lambda_source_dir}/GetOrders/build"
  output_path = "${local.zipped_lambda_dir}/GetOrders.zip"
}

resource "aws_lambda_function" "get_orders" {
  function_name    = "getOrders"
  role             = aws_iam_role.lambda_iam_role.arn
  runtime          = "nodejs18.x"
  handler          = "index.handler"
  filename         = data.archive_file.lambda_get_orders_zip.output_path
  source_code_hash = data.archive_file.lambda_get_orders_zip.output_base64sha256
}

resource "null_resource" "sam_metadata_aws_lambda_function_get_orders" {
  triggers = {
    resource_name        = "aws_lambda_function.get_orders"
    resource_type        = "ZIP_LAMBDA_FUNCTION"
    original_source_code = "${local.lambda_source_dir}/GetOrders/build"
    built_output_path    = "${local.zipped_lambda_dir}/GetOrders.zip"
  }
}
