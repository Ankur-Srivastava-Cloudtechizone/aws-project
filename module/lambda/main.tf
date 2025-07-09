resource "aws_iam_role" "lambda_exec_role" {
  for_each           = var.lambda_functions
  name               = each.value.role_name
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_lambda_function" "lambda_fn" {
  for_each       = var.lambda_functions
  function_name  = each.value.function_name
  handler        = each.value.handler
  runtime        = each.value.runtime
  role           = aws_iam_role.lambda_exec_role[each.key].arn
  filename       = each.value.zip_path
  timeout        = each.value.timeout
  memory_size    = each.value.memory_size

  environment {
    variables = each.value.environment_variables
  }
}