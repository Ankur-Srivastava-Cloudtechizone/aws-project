output "vpc_id" {
  value = aws_vpc.this.id
}

output "private_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.private : key => subnet.id
  }
}

output "route_table_id" {
  value = aws_route_table.this.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
}
