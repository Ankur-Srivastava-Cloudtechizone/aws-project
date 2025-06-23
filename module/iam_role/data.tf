data "aws_iam_policy_document" "trust_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::134449592952:user/ankursrivastava"]
    }
    actions = ["sts:AssumeRole"]
  }
}