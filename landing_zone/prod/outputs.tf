output "prod_vpc_ids" {
  value = module.vpc.vpc_ids
}

output "prod_public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "prod_private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "prod_igw_ids" {
  value = module.vpc.igw_ids
}

output "prod_route_table_ids" {
  value = module.vpc.route_table_ids
}


output "security_group_ids" {
  value = module.security_groups.security_group_ids
}

output "prod_private_key_pem" {
  value     = module.ec2_keypair.private_key_pem
  sensitive = true
}

# output "alb_dns_name" {
#   value = module.alb.alb_dns_name
# }
