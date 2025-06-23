terraform {
  backend "s3" {
    bucket         = "darpg-shared-backup-central"
    key            = "preprod/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    }
}

