terraform {
  backend "s3" {
    bucket         = "darpg-shared-backup-central"
    key            = "test/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    }
}

