data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "trust_policy_prod" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/ankursrivastava"]
    }
    actions = ["sts:AssumeRole"]
  }
}
