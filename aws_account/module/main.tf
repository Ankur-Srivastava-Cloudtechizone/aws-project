resource "aws_organizations_account" "this" {
  for_each = var.accounts

  name      = each.value.name
  email     = each.value.email
  role_name = each.value.role_name
  tags      = each.value.tags

  close_on_deletion = false
  lifecycle {
    prevent_destroy = true
  }
}
