resource "aws_vpc" "this" {
  for_each = var.vpcs

  cidr_block = each.value.cidr_block
  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "this" {
  for_each = { for pair in flatten([
    for vpc_name, vpc in var.vpcs : [
      for subnet_name, subnet in vpc.subnets : {
        key               = "${vpc_name}-${subnet_name}"
        vpc_name          = vpc_name
        subnet_name       = subnet_name
        cidr_block        = subnet.cidr_block
        availability_zone = subnet.availability_zone
      }
    ]
  ]) : pair.key => pair }

  vpc_id            = aws_vpc.this[each.value.vpc_name].id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.value.subnet_name
  }
}
