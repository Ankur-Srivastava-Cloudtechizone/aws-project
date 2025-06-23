provider "aws" {
  region  = "ap-south-1"
  profile = "management"
  assume_role {
    role_arn     = "arn:aws:iam::${data.terraform_remote_state.management.outputs.account_ids["sharedservices"]}:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}

module "s3" {
  source    = "../../module/s3"
  providers = { aws = aws }
  buckets   = var.buckets
}
