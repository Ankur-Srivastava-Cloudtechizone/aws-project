resource "aws_organizations_account" "account" {
  provider  = aws
  for_each  = var.accounts

  name      = each.value.name
  email     = each.value.email
  parent_id = each.value.parent_id

  role_name = var.role_name

  tags = {
    Environment = each.value.environment
  }
}
