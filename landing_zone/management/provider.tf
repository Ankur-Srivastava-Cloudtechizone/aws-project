provider "aws" {
  alias  = "management"
  region = "ap-south-1"
}

provider "aws" {
  alias      = "prod"
  region     = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${local.prod_account_id}:role/TerraformExecutionRole"
    session_name = "AnkurSession"
  }
}

provider "aws" {
  alias      = "preprod"
  region     = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${local.preprod_account_id}:role/TerraformExecutionRole"
    session_name = "AnkurSession"
  }
}

provider "aws" {
  alias      = "sharedservices"
  region     = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${local.preprod_account_id}:role/TerraformExecutionRole"
    session_name = "AnkurSession"
  }
}

provider "aws" {
  alias      = "test"
  region     = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${local.preprod_account_id}:role/TerraformExecutionRole"
    session_name = "AnkurSession"
  }
}

provider "aws" {
  alias      = "dev"
  region     = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${local.preprod_account_id}:role/TerraformExecutionRole"
    session_name = "AnkurSession"
  }
}

provider "aws" {
  alias      = "dr"
  region     = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${local.preprod_account_id}:role/TerraformExecutionRole"
    session_name = "AnkurSession"
  }
}

