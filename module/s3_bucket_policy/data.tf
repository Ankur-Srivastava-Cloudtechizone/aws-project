data "aws_iam_policy_document" "policy" {
  for_each = var.bucket_policies

  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = each.value.allowed_principals
    }

    actions = [
      "s3:PutObject",
      "s3:GetObject"
    ]

    resources = [
      "arn:aws:s3:::${each.value.bucket_name}",
      "arn:aws:s3:::${each.value.bucket_name}/*"
    ]
  }
}