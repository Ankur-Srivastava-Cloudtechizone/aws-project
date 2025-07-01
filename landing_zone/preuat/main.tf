module "vpc" {
  source    = "../../module/vpc"
  providers = {
  aws = aws.preuat
}


  vpcs = var.vpcs
}

module "ec2_keypair" {
  source          = "../../module/key_pair"
  keypair_name    = var.keypair_name
  s3_bucket_name  = data.terraform_remote_state.sharedservices.outputs.central_backup_bucket_name
  folder_name     = var.keypair_folder

  providers = {
    aws = aws.preuat
  }
}




module "security_groups" {
  source = "../../module/security_group"
  providers = {
    aws = aws.preuat
  }
  security_groups = var.security_groups
}


module "ec2_prod" {
  source = "../../module/ec2"
  providers = {
    aws = aws.preuat
  }
  instances = var.instances
  security_group_name = var.security_group_name
  subnet_name = var.subnet_name
  depends_on = [ module.security_groups, module.ec2_keypair, module.vpc ]
  
}

module "alb" {
  source = "../../module/alb"
  providers = {
    aws = aws.preuat
  }
  name               = "preuat-alb"
  vpc_id             = module.vpc.vpc_ids["preuat-vpc"]
  subnet_ids         = [
    module.vpc.subnet_ids["preuat-vpc-public-subnet-1"],
    module.vpc.subnet_ids["preuat-vpc-public-subnet-2"]
  ]
  security_group_ids = [
    module.security_groups.security_group_ids["preuat-web-sg"]
  ]
  environment        = "preuat"
}
