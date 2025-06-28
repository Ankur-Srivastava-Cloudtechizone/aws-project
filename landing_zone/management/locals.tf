locals {
  project     = "DARPG"
  environment = "management"
  owner       = "ankursrivastava"
  management_account_id = data.aws_caller_identity.current.account_id
}
