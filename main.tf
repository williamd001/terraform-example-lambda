terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "archive_file" "lambda_get_order_zip" {
  type = "zip"

  source_dir  = "${path.module}/resources/GetOrder"
  output_path = "${path.module}/resources/GetOrder.zip"
}

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

resource "aws_lambda_function" "get_order" {
  function_name    = "getOrderV3"
  role             = aws_iam_role.lambda_iam_role.arn
  runtime          = "nodejs18.x"
  filename         = "${path.module}/resources/GetOrder.zip"
  handler          = "index.handler"
  source_code_hash = data.archive_file.lambda_get_order_zip.output_base64sha256
}
