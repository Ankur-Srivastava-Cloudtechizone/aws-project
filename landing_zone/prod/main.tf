module "vpc" {
  source          = "../../module/vpc"
  environment     = var.environment
  vpc_cidr_block  = var.vpc_cidr_block
  subnet_configs  = var.subnet_configs
  tags            = var.tags
}




module "ec2_prod" {
  source = "../../module/ec2"
  providers = {
    aws = aws.prod
  }
  instances           = var.instances
  subnet_id           = module.vpc.private_subnet_ids["public-subnet-1"]
  security_group_id   = module.security_group.security_group_ids["prod-web-sg"]
  depends_on          = [ module.vpc, module.security_group, module.ec2_keypair ]
}


module "security_group" {
  source          = "../../module/security_group"
  vpc_id          = module.vpc.vpc_id
  security_groups = var.security_groups
}



module "ec2_prod" {
  source = "../../module/ec2"

  providers = {
    aws = aws.prod
  }

  instances = var.instances

  # Yahan pe subnet aur SG ka ID pass karenge
  subnet_id          = module.vpc.private_subnet_ids["public-subnet-1"]
  security_group_id  = module.security_group.security_group_ids["prod-web-sg"]

  depends_on = [ module.vpc, module.security_group, module.ec2_keypair ]
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
