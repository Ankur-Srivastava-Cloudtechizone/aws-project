data "terraform_remote_state" "management" {
  backend = "s3"
  config = {
    bucket = "darpg-shared-backup-central"
    key    = "management/terraform.tfstate"
    region = "ap-south-1"
    profile = "management"
  }
}

data "terraform_remote_state" "sharedservices" {
  backend = "s3"
  config = {
    bucket = "darpg-shared-backup-central"
    key    = "sharedservices/terraform.tfstate"
    region = "ap-south-1"
    profile = "management"
  }
}

