module "vpc" {
  source    = "../../module/vpc"
  providers = {
  aws = aws.prod
}


  vpcs = var.vpcs
}

module "ec2_keypair" {
  source          = "../../module/key_pair"
  keypair_name    = var.keypair_name
  s3_bucket_name  = data.terraform_remote_state.sharedservices.outputs.central_backup_bucket_name
  folder_name     = var.keypair_folder

  providers = {
    aws = aws.prod
  }
}




module "security_groups" {
  source = "../../module/security_group"
  providers = {
    aws = aws.prod
  }
  security_groups = var.security_groups
}


module "ec2_prod" {
  source = "../../module/ec2"
  providers = {
    aws = aws.prod
  }
  instances = var.instances
  security_group_name = var.security_group_name
  subnet_name = var.subnet_name
}
