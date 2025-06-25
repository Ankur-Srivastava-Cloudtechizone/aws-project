output "account_ids" {
  value = module.accounts.account_ids
}

output "role_names" {
  value = {
    for env, account_id in module.accounts.account_ids :
    env => "${var.role_name}"
  }
}

output "preprod_role_arn" {
  value = module.iam_roles_preprod.role_arn
}

output "prod_role_arn" {
  value = module.iam_roles_prod.role_arn
}


output "sharedservices_role_arn" {
  value = module.iam_roles_sharedservices.role_arn
}
