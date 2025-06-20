module "aws_accounts" {
  source   = "./module"
  accounts = var.accounts
}

module "vpc" {
  source                 = "../../modules/vpc"
  aws_region            = var.aws_region
  vpc_config            = var.vpc_config
  internet_gateway_tags = var.internet_gateway_tags
  public_subnets        = var.public_subnets
  route_table_tags      = var.route_table_tags
  providers = {
    aws = aws.current
  }
}


module "security_group" {
  source         = "../../modules/sg"
  sg_name        = var.sg_name
  sg_description = var.sg_description
  vpc_id         = module.vpc.vpc_id
  tags           = var.sg_tags
  ingress_rules  = var.ingress_rules
  egress_rules   = var.egress_rules
  depends_on     = [module.vpc]
  providers = {
    aws = aws.current
  }
}

module "key_pair" {
  source      = "../../modules/key_pair"
  key_name    = "darpg-key"
  tags        = { Name = "darpg-key" }
  bucket_name = "darpg-tfstate-bucket"
  providers = {
    aws = aws.current
  }
}

module "ec2_instances" {
  source    = "../../modules/ec2"
  instances = var.instances
  providers = {
    aws = aws.current
  }
  depends_on = [
    module.vpc,
    module.security_group,
    module.key_pair
  ]
}
