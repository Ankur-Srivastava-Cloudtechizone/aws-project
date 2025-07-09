output "lambda_function_arns" {
  value = { for k, v in aws_lambda_function.lambda_fn : k => v.arn }
}
