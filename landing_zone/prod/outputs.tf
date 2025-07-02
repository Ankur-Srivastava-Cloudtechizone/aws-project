output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "route_table_id" {
  value = module.vpc.route_table_id
}


# output "prod_igw_ids" {
#   value = module.vpc.igw_ids
# }

# output "prod_route_table_ids" {
#   value = module.vpc.route_table_ids
# }


# output "security_group_ids" {
#   value = module.security_groups.security_group_ids
# }

output "prod_private_key_pem" {
  value     = module.ec2_keypair.private_key_pem
  sensitive = true
}

# output "alb_dns_name" {
#   value = module.alb.alb_dns_name
# }
