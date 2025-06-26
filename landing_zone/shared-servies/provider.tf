provider "aws" {
  alias   = "sharedservices"
  region  = "ap-south-1"
  profile = "management"
  assume_role {
    role_arn     = "arn:aws:iam::${data.terraform_remote_state.management.outputs.account_ids["sharedservices"]}:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}
provider "aws" {
  alias   = "prod"
  region  = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::102800182323:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}

provider "aws" {
  alias   = "preprod"
  region  = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::987626324847:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}
