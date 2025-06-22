module "iam_user" {
  source    = "../../module/iam_user"
  user_name = var.user_name
}



module "terraform_execution_role" {
  source               = "../../module/iam_role"
  name                 = var.role_name
  trusted_account_arn  = var.trusted_account_arn
}


module "vpc" {
  source = "../../module/vpc"

  providers = {
    aws = aws.current
  }

  vpc_name   = var.vpc_name
  cidr_block = var.cidr_block
  azs        = var.azs
}
