locals {
  project     = "DARPG"
  environment = "management"
  owner       = "ankursrivastava"
}

locals {
  preprod_account_id = [
    for a in data.aws_organizations_organization.this.accounts : a.id
    if a.name == "preprod"
  ][0]

  prod_account_id = [
    for a in data.aws_organizations_organization.this.accounts : a.id
    if a.name == "prod"
  ][0]

  sharedservices_account_id = [
    for a in data.aws_organizations_organization.this.accounts : a.id
    if a.name == "sharedservices"
  ][0]

  test_account_id = [
    for a in data.aws_organizations_organization.this.accounts : a.id
    if a.name == "test"
  ][0]

  dev_account_id = [
    for a in data.aws_organizations_organization.this.accounts : a.id
    if a.name == "dev"
  ][0]

  dr_account_id = [
    for a in data.aws_organizations_organization.this.accounts : a.id
    if a.name == "dr"
  ][0]
}
