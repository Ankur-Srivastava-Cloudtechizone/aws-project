data "terraform_remote_state" "management" {
  backend = "s3"
  config = {
    bucket = "darpg-shared-backup-central"
    key    = "management/terraform.tfstate"
    region = "ap-south-1"
    profile = "management"
  }
}

data "terraform_remote_state" "prod" {
  backend = "s3"
  config = {
    bucket = "darpg-shared-backup-central"
    key    = "prod/terraform.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "preprod" {
  backend = "s3"
  config = {
    bucket = "darpg-shared-backup-central"
    key    = "preprod/terraform.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "dev" {
  backend = "s3"
  config = {
    bucket = "darpg-shared-backup-central"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}