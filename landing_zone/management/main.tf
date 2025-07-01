module "accounts" {
  source = "../../module/account"
  providers = {
    aws = aws.management
  }
  accounts  = var.accounts
  role_name = var.role_name
}

resource "aws_s3_bucket" "remote_state" {
  bucket = "darpg-shared-backup-central"

  tags = {
    Environment = "management"
  }
}

module "iam_user_backend_policy" {
  source = "../../module/iam_user"
  providers = {
    aws = aws.management
  }
  users = var.users
  depends_on = [module.accounts]
}

module "iam_roles_prod" {
  source = "../../module/iam_role"
  providers = {
    aws = aws.prod
  }
  role_name        = "TerraformExecutionRole"
  trusted_accounts = [local.management_account_id]
  depends_on = [module.accounts]
}

module "iam_roles_preprod" {
  source = "../../module/iam_role"
  providers = {
    aws = aws.preuat
  }
  role_name        = "TerraformExecutionRole"
  trusted_accounts = [local.management_account_id]
  depends_on = [module.accounts]
}

module "iam_roles_sharedservices" {
  source = "../../module/iam_role"
  providers = {
    aws = aws.sharedservices
  }
  role_name        = "TerraformExecutionRole"
  trusted_accounts = [local.management_account_id]
  depends_on = [module.accounts]
}


##1234