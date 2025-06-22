resource "aws_organizations_account" "this" {
  for_each  = var.accounts
  name      = each.value.name
  email     = each.value.email
  role_name = "OrganizationAccountAccessRole"
}

