data "terraform_remote_state" "management" {
  backend = "local"
  config = {
    path = "../management/terraform.tfstate"
  }
}

provider "aws" {
  alias  = "prod"
  region = "ap-south-1"
  assume_role {
    role_arn     = "arn:aws:iam::${data.terraform_remote_state.management.outputs.account_ids["prod"]}:role/TerraformExecutionRole"
    session_name = "TerraformSession"
  }
}
