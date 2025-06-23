module "vpc" {
  source    = "../../module/vpc"
  providers = { aws = aws.preprod }

  vpcs = var.vpcs
}
