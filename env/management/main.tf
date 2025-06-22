module "aws_accounts" {
  source   = "../../module/account"
  accounts = var.accounts
}

module "prod_role" {
  source    = "../../module/iam_role"
  providers = { aws = aws.prod }

  roles = {
    exec_role = {
      name               = "TerraformExecutionRole"
      assume_role_policy = data.aws_iam_policy_document.trust_policy_prod.json
      policy_arn         = "arn:aws:iam::aws:policy/AdministratorAccess"
    }
  }
}
