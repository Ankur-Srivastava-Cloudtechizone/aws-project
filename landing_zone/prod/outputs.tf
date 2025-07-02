output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "route_table_id" {
  value = module.vpc.route_table_id
}


output "prod_igw_id" {
  value = module.vpc.igw_id
}


output "security_group_ids" {
  value = module.security_group.security_group_ids
}

output "prod_private_key_pem" {
  value     = module.ec2_keypair.private_key_pem
  sensitive = true
}

# output "alb_dns_name" {
#   value = module.alb.alb_dns_name
# }
output "instance_ids" {
  value = module.ec2.instance_ids
}
