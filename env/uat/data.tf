data "terraform_remote_state" "management" {
  backend = "local"
  config = {
    path = "../management/terraform.tfstate"
  }
}

resource "null_resource" "wait_for_management" {
  triggers = {
    management_state = data.terraform_remote_state.management.outputs.account_ids["uat_account_id"]
  }
}
