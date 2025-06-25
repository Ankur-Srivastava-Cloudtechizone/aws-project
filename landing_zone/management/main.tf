module "accounts" {
  source = "../../module/account"
  providers = {
    aws = aws.management
  }
  accounts = var.accounts
}


module "iam_roles_prod" {
  source = "../../module/iam_role"
  providers = {
    aws = aws.prod
  }
  role_name        = "TerraformExecutionRole"
  trusted_accounts = [local.management_account_id]
}

module "iam_roles_preprod" {
  source = "../../module/iam_role"
  providers = {
    aws = aws.preprod
  }
  role_name        = "TerraformExecutionRole"
  trusted_accounts = [local.management_account_id]
}

module "iam_roles_sharedservices" {
  source = "../../module/iam_role"
  providers = {
    aws = aws.sharedservices
  }
  role_name        = "TerraformExecutionRole"
  trusted_accounts = [local.management_account_id]
}

module "iam_roles_test" {
  source = "../../module/iam_role"
  providers = {
    aws = aws.test
  }
  role_name        = "TerraformExecutionRole"
  trusted_accounts = [local.management_account_id]
}

module "iam_roles_dev" {
  source = "../../module/iam_role"
  providers = {
    aws = aws.dev
  }
  role_name        = "TerraformExecutionRole"
  trusted_accounts = [local.management_account_id]
}

module "iam_roles_dr" {
  source = "../../module/iam_role"
  providers = {
    aws = aws.dr
  }
  role_name        = "TerraformExecutionRole"
  trusted_accounts = [local.management_account_id]
}
