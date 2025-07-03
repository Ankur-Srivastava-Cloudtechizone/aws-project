module "vpc" {
  source          = "../../module/vpc"
  environment     = var.environment
  vpc_cidr_block  = var.vpc_cidr_block
  subnet_configs  = var.subnet_configs
  tags            = var.tags
  providers = {
    aws = aws.prod
  }
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

module "security_group" {
  source          = "../../module/security_group"
  vpc_id          = module.vpc.vpc_id
  security_groups = var.security_groups
  providers = {
    aws = aws.prod
  }
}


module "ec2" {
  source      = "../../module/ec2"
  depends_on = [ module.ec2_keypair,module.security_group,module.vpc ]
  environment = var.environment
  ec2_instances = {
    for k, v in var.ec2_instances :
    k => {
      ami                = v.ami
      instance_type      = v.instance_type
      subnet_id          = module.vpc.subnet_ids[v.subnet_logical_name]
      key_name           = "darpg-prod-keypair"
      security_group_ids = [for sg in v.sg_names : module.security_group.security_group_ids[sg]]
    }
  }
  providers = {
    aws = aws.prod
  }
}





# module "alb" {
#   source = "../../module/alb"
#   providers = {
#     aws = aws.prod
#   }
#   name               = "prod-alb"
#   vpc_id             = module.vpc.vpc_ids["prod-vpc"]
#   subnet_ids         = [
#     module.vpc.subnet_ids["prod-vpc-public-subnet-1"],
#     module.vpc.subnet_ids["prod-vpc-public-subnet-2"]
#   ]
#   security_group_ids = [
#     module.security_groups.security_group_ids["prod-web-sg"]
#   ]
#   environment        = "prod"
# }
