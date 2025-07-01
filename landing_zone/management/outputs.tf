output "account_ids" {
  value = {
    for acct in data.aws_organizations_organization.this.accounts :
    acct.name => acct.id
  }
}

output "remote_state_bucket_name" {
  value = aws_s3_bucket.remote_state.bucket
}

output "role_names" {
  value = {
    for acct in data.aws_organizations_organization.this.accounts :
    acct.name => "OrganizationAccountAccessRole"
  }
}

output "preuat_role_arn" {
  value = module.iam_roles_preprod.role_arn
}

output "prod_role_arn" {
  value = module.iam_roles_prod.role_arn
}

output "sharedservices_role_arn" {
  value = module.iam_roles_sharedservices.role_arn
}
