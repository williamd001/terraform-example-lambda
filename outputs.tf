output "function_name" {
  description = "Name of the Lambda function."

  value = aws_lambda_function.get_order.function_name
}
