provider "aws" {
  alias   = "dev"
  region  = "ap-south-1"
  profile = "management"
  assume_role {
    role_arn     = "arn:aws:iam::${data.terraform_remote_state.management.outputs.account_ids["dev"]}:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}
