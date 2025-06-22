output "account_ids" {
  value = {
    for k, v in aws_organizations_account.this : k => v.id
  }
}
