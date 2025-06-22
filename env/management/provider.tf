provider "aws" {
  alias  = "default"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "prod"
  region = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::427220766125:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}
