resource "aws_iam_role" "this" {
  for_each = var.roles

  name               = each.value.name
  assume_role_policy = each.value.assume_role_policy
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = var.roles

  role       = aws_iam_role.this[each.key].name
  policy_arn = each.value.policy_arn
}
