terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }

  # backend "s3" {
  #   bucket         = "darpg-tfstate-bucket"
  #   key            = "dev/terraform.tfstate"
  #   region         = "ap-south-1"

  # }
}

provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = "arn:aws:iam::${lookup(var.accounts, var.env)}:role/TerraformExecutionRole"
  }
  alias  = "current"
}
