provider "aws" {
  region = "ap-south-1"
  profile = "management"
  assume_role {
    role_arn     = "arn:aws:iam::979156606832:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}
