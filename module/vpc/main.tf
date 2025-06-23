resource "aws_vpc" "this" {
  for_each = var.vpcs

  cidr_block = each.value.cidr_block

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "this" {
  for_each = {
    for pair in flatten([
      for vpc_name, vpc in var.vpcs : [
        for subnet_name, subnet in vpc.subnets : {
          key               = "${vpc_name}-${subnet_name}"
          vpc_name          = vpc_name
          subnet_name       = subnet_name
          cidr_block        = subnet.cidr_block
          availability_zone = subnet.availability_zone
        }
      ]
    ]) : pair.key => pair
  }

  vpc_id            = aws_vpc.this[each.value.vpc_name].id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.value.subnet_name
  }
}

resource "aws_internet_gateway" "this" {
  for_each = var.vpcs

  vpc_id = aws_vpc.this[each.key].id

  tags = {
    Name = "${each.key}-igw"
  }
}

resource "aws_route_table" "this" {
  for_each = var.vpcs

  vpc_id = aws_vpc.this[each.key].id

  tags = {
    Name = "${each.key}-rt"
  }
}

resource "aws_route" "this" {
  for_each = var.vpcs

  route_table_id         = aws_route_table.this[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[each.key].id

  depends_on = [aws_internet_gateway.this]
}

resource "aws_route_table_association" "this" {
  for_each = {
    for pair in flatten([
      for vpc_name, vpc in var.vpcs : [
        for subnet_name, subnet in vpc.subnets : {
          key        = "${vpc_name}-${subnet_name}"
          vpc_name   = vpc_name
          subnet_key = "${vpc_name}-${subnet_name}"
        }
      ]
    ]) : pair.key => pair
  }

  subnet_id      = aws_subnet.this[each.value.subnet_key].id
  route_table_id = aws_route_table.this[each.value.vpc_name].id

  depends_on = [aws_subnet.this, aws_route.this]
}
