resource "aws_iam_role" "lambda_iam_role" {
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

data "archive_file" "lambda_get_customers_zip" {
  type        = "zip"
  source_dir  = "${path.module}/resources/lambdas/GetCustomers/build"
  output_path = "${path.module}/zipped/GetCustomers.zip"
}

resource "aws_lambda_function" "get_customers" {
  function_name    = "getCustomers"
  role             = aws_iam_role.lambda_iam_role.arn
  runtime          = "nodejs18.x"
  handler          = "index.handler"
  filename         = data.archive_file.lambda_get_customers_zip.output_path
  source_code_hash = data.archive_file.lambda_get_customers_zip.output_base64sha256
}

data "archive_file" "lambda_get_orders_zip" {
  type = "zip"
  source_dir  = "${path.module}/resources/lambdas/GetOrders/build"
  output_path = "${path.module}/zipped/GetOrders.zip"
}

resource "aws_lambda_function" "get_orders" {
  function_name    = "getOrders"
  role             = aws_iam_role.lambda_iam_role.arn
  runtime          = "nodejs18.x"
  handler          = "index.handler"
  filename         = data.archive_file.lambda_get_orders_zip.output_path
  source_code_hash = data.archive_file.lambda_get_orders_zip.output_base64sha256
}
