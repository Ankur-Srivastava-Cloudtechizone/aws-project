resource "aws_iam_role" "this" {
  provider            = aws
  name               = "OrganizationAccountAccessRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role" "terraform_execution" {
  provider            = aws
  name               = "TerraformExecutionRole"
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
  provider = aws
  name     = "${var.role_name}-policy"
  role     = aws_iam_role.terraform_execution.name
  policy   = data.aws_iam_policy_document.execution_policy.json
}

resource "aws_iam_role_policy" "list_all_buckets" {
  provider = aws
  name     = "ListAllBucketsPolicy"
  role     = aws_iam_role.this.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:ListAllMyBuckets"
        ],
        Resource = "*"
      }
    ]
  })
}
