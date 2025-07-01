output "vpc_ids" {
  value = {
    for key, vpc in aws_vpc.this : key => vpc.id
  }
}

output "public_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.public : key => subnet.id
  }
}

output "private_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.private : key => subnet.id
  }
}

output "igw_ids" {
  value = {
    for key, igw in aws_internet_gateway.this : key => igw.id
  }
}

output "route_table_ids" {
  value = {
    for key, rt in aws_route_table.this : key => rt.id
  }
}
