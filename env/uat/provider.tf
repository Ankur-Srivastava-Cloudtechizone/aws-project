provider "aws" {
  region  = "ap-south-1"
  profile = "management"
  assume_role {
    role_arn     = "arn:aws:iam::${data.terraform_remote_state.management.outputs.account_ids["uat_account_id"]}:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}
