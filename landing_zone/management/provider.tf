# provider.tf
provider "aws" {
  region  = "ap-south-1"
  profile = "management"
}

# Module providers
provider "aws" {
  alias   = "preprod"
  region  = "ap-south-1"
  profile = "management"
  assume_role {
    role_arn     = "arn:aws:iam::${module.aws_accounts.account_ids["preprod"]}:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}

provider "aws" {
  alias   = "prod"
  region  = "ap-south-1"
  profile = "management"
  assume_role {
    role_arn     = "arn:aws:iam::${module.aws_accounts.account_ids["prod"]}:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}

provider "aws" {
  alias   = "sharedservices"
  region  = "ap-south-1"
  profile = "management"
  assume_role {
    role_arn     = "arn:aws:iam::${module.aws_accounts.account_ids["sharedservices"]}:role/OrganizationAccountAccessRole"
    session_name = "TerraformSession"
  }
}
