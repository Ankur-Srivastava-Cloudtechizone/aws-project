module "s3" {
  source    = "../../module/s3"
  providers = {
    aws = aws.sharedservices
  }
  buckets       = var.buckets
  allowed_roles = [
    "arn:aws:iam::${data.terraform_remote_state.management.outputs.account_ids.prod}:role/OrganizationAccountAccessRole",
    "arn:aws:iam::${data.terraform_remote_state.management.outputs.account_ids.preprod}:role/OrganizationAccountAccessRole",
    "arn:aws:iam::${data.terraform_remote_state.management.outputs.account_ids.sharedservices}:role/OrganizationAccountAccessRole",
    # "arn:aws:iam::${data.terraform_remote_state.management.outputs.account_ids.dr}:role/OrganizationAccountAccessRole",
    # "arn:aws:iam::${data.terraform_remote_state.management.outputs.account_ids.dev}:role/OrganizationAccountAccessRole",
    # "arn:aws:iam::${data.terraform_remote_state.management.outputs.account_ids.test}:role/OrganizationAccountAccessRole"
  ]
}

module "transit_gateway" {
  source   = "../../module/transit_gateway"
  tgw_name = var.tgw_name

  vpc_attachments = {
    prod = {
      vpc_id     = data.terraform_remote_state.prod.outputs.vpc_ids["prod-vpc"]
      subnet_ids = [
        data.terraform_remote_state.prod.outputs.subnet_ids["prod-private-subnet-1"],
        data.terraform_remote_state.prod.outputs.subnet_ids["prod-private-subnet-2"]
      ]
    }
  
  }
}
