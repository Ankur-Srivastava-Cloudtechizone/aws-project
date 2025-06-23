module "vpc" {
  source    = "../../module/vpc"
  providers = { aws = aws.prod }

  vpcs = var.vpcs
}
