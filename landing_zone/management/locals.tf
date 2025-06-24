locals {
  project     = "DARPG"
  environment = "management"
  owner       = "ankursrivastava"
}

locals {
  roles = {
    TerraformExecutionRole = {
      role_name  = "TerraformExecutionRole"
      policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
      trust_policy = data.aws_iam_policy_document.trust_policy.json
    }
  }
}