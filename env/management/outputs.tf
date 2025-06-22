output "management_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "account_ids" {
  value = module.aws_accounts.account_ids
}
