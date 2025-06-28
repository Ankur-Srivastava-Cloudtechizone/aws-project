provider "aws" {
  alias   = "sharedservices"
  region  = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_account_id}:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}
