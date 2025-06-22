resource "aws_iam_user" "this" {
  for_each = var.users
  name     = each.value.user_name
}

resource "aws_iam_user_login_profile" "this" {
  for_each                = var.users
  user                    = aws_iam_user.this[each.key].name
  password_length         = 16
  password_reset_required = false
}

resource "aws_iam_user_policy_attachment" "this" {
  for_each   = var.users
  user       = aws_iam_user.this[each.key].name
  policy_arn = each.value.policy_arn
}

