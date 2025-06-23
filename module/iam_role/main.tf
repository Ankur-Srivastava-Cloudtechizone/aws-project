resource "aws_iam_role" "terraform_execution" {
  name = var.role_name

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = var.trusted_accounts
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "execution_policy" {
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "execution_policy_attachment" {
  name   = "${var.role_name}-policy"
  role   = aws_iam_role.terraform_execution.name
  policy = data.aws_iam_policy_document.execution_policy.json
}
