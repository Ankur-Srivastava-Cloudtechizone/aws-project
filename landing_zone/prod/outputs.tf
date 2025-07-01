output "vpc_ids" {
  value = module.vpc.vpc_ids
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}

# output "security_group_ids" {
#   value = module.security_groups.security_group_ids
# }

# output "prod_private_key_pem" {
#   value     = module.ec2_keypair.private_key_pem
#   sensitive = true
# }

# output "alb_dns_name" {
#   value = module.alb.alb_dns_name
# }
