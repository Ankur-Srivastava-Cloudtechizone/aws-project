module "vpc" {
  source    = "../../module/vpc"
  providers = {
  aws = aws.prod
}


  vpcs = var.vpcs
}

# module "keypairs" {
#   source      = "../../module/key_pair"
#   keypairs    = var.keypairs
#   bucket_name = var.key_backup_bucket
# }


module "security_groups" {
  source          = "../../module/sg"
  security_groups = var.security_groups
}

# module "instances" {
#   source    = "../../module/ec2"
#   instances = var.instances
#   providers = {
#   aws = aws.prod
# }

