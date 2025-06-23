data "terraform_remote_state" "management" {
  backend = "local"
  config = {
    path = "../management/terraform.tfstate"
  }
}
