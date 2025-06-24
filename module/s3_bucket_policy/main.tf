resource "aws_s3_bucket_policy" "this" {
  for_each = var.bucket_policies

  bucket = each.value.bucket_name

  policy = data.aws_iam_policy_document.policy[each.key].json
}
