module "aws_accounts" {
  source   = "../../module/account"
  accounts = var.accounts
}

module "iam_roles_preprod" {
  source    = "../../module/iam_role"
  providers = { aws = aws.preprod }

  role_name        = "TerraformExecutionRole"
  trusted_accounts = ["arn:aws:iam::134449592952:root"]  # management account ID
  depends_on       = [module.aws_accounts]
}


locals {
  roles = {
    TerraformExecutionRole = {
      role_name  = "TerraformExecutionRole"
      policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
      trust_policy = data.aws_iam_policy_document.trust_policy.json
    }
  }
}

module "iam_roles_prod" {
  source    = "../../module/iam_role"
  providers = { aws = aws.prod }

  role_name        = "TerraformExecutionRole"
  trusted_accounts = ["arn:aws:iam::134449592952:root"]  # management account ID
  depends_on       = [module.aws_accounts]
}