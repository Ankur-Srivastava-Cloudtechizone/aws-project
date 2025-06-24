module "aws_accounts" {
  source   = "../../module/account"
  accounts = var.accounts
  
}

module "iam_roles_preprod" {
  source    = "../../module/iam_role"
  providers = {
  aws = aws.management
}


  role_name        = "TerraformExecutionRole"
  trusted_accounts = ["arn:aws:iam::134449592952:root"]  # management account ID
  depends_on       = [module.aws_accounts]
}




module "iam_roles_prod" {
  source    = "../../module/iam_role"
  providers = {
  aws = aws.management
}


  role_name        = "TerraformExecutionRole"
  trusted_accounts = ["arn:aws:iam::134449592952:root"]  # management account ID
  depends_on       = [module.aws_accounts]
}

module "iam_roles_sharedservices" {
  source    = "../../module/iam_role"
  providers = {
  aws = aws.management
}


  role_name        = "TerraformExecutionRole"
  trusted_accounts = ["arn:aws:iam::134449592952:root"]  # management account ID
  depends_on       = [module.aws_accounts]
}