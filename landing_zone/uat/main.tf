# module "vpc" {
#   source    = "../../module/vpc"
#   providers = { aws = aws.prod }

#   vpcs = var.vpcs
# }

# module "keypairs" {
#   source   = "../../module/key_pair"
#   keypairs = var.keypairs
# }

# module "security_groups" {
#   source          = "../../module/sg"
#   security_groups = var.security_groups
# }

# module "instances" {
#   source    = "../../module/ec2"
#   instances = var.instances
# }
