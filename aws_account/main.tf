module "aws_accounts" {
  source   = "./module"
  accounts = var.accounts
}