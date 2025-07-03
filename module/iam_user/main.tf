resource "aws_iam_user" "this" {
  provider = aws
  for_each = var.users

  name = each.value.user_name
}

resource "aws_iam_user_policy_attachment" "this" {
  provider = aws
  for_each = var.users

  user       = aws_iam_user.this[each.key].name
  policy_arn = each.value.policy_arn
}

resource "aws_iam_user_login_profile" "this" {
  provider = aws
  for_each = var.users

  user                    = aws_iam_user.this[each.key].name
  password_reset_required = true
  password_length         = 16
}

resource "aws_iam_policy" "this" {
  provider    = aws
  name        = "TerraformBackendS3AccessPolicy"
  description = "Policy to allow Terraform user to access S3 backend bucket"
  policy      = data.aws_iam_policy_document.backend_access_policy.json
}

data "aws_iam_policy_document" "backend_access_policy" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::darpg-shared-backup-central",
      "arn:aws:s3:::darpg-shared-backup-central/*"
    ]
  }
}

resource "aws_iam_user_policy_attachment" "backend_policy_attachment" {
  provider = aws
  user       = "ankursrivastava"
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_policy" "console_s3_access" {
  provider    = aws
  name        = "ConsoleS3ListAndBackupBucketAccess"
  description = "Allow listing all buckets and access darpg-shared-backup-central"
  policy      = data.aws_iam_policy_document.console_s3_access.json
}

data "aws_iam_policy_document" "console_s3_access" {
  statement {
    actions = [
      "s3:ListAllMyBuckets"
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:ListBucket",
      "s3:GetBucketVersioning",
      "s3:GetObjectAcl",
      "s3:GetObjectTagging",
      "s3:PutObjectAcl"
    ]
    resources = [
      "arn:aws:s3:::darpg-shared-backup-central",
      "arn:aws:s3:::darpg-shared-backup-central/*"
    ]
  }
}

resource "aws_iam_user_policy_attachment" "console_s3_access_attach" {
  provider = aws
  user       = "ankursrivastava"
  policy_arn = aws_iam_policy.console_s3_access.arn
}
