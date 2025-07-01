provider "aws" {
  alias  = "management"
  region = "ap-south-1"
  # profile = "management"
}

provider "aws" {
  alias      = "prod"
  region     = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${module.accounts.account_ids["prod"]}:role/OrganizationAccountAccessRole"
    session_name = "AnkurSession"
  }
}

provider "aws" {
  alias      = "preuat"
  region     = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${module.accounts.account_ids["preuat"]}:role/OrganizationAccountAccessRole"
    session_name = "AnkurSession"
  }
}

provider "aws" {
  alias      = "preprod"
  region     = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${module.accounts.account_ids["preprod"]}:role/OrganizationAccountAccessRole"
    session_name = "AnkurSession"
  }
}

provider "aws" {
  alias      = "sharedservices"
  region     = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${module.accounts.account_ids["sharedservices"]}:role/OrganizationAccountAccessRole"
    session_name = "AnkurSession"
  }
}
