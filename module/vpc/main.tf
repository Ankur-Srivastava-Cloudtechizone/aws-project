resource "aws_vpc" "this" {
  for_each   = var.vpc_configs

  cidr_block = each.value.cidr_block

  tags = {
    Name        = "${var.environment}-${each.key}-vpc"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "this" {
  for_each = aws_vpc.this

  vpc_id = each.value.id

  tags = {
    Name        = "${var.environment}-${each.key}-igw"
    Environment = var.environment
  }
}

resource "aws_subnet" "public" {
  for_each = {
    for subnet_key, subnet_val in var.subnet_configs :
    subnet_key => subnet_val
    if subnet_val.type == "public"
  }

  vpc_id            = aws_vpc.this[each.value.vpc_key].id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    Name        = "${var.environment}-${each.key}-subnet"
    Environment = var.environment
  }
}

resource "aws_route_table" "public" {
  for_each = aws_vpc.this

  vpc_id = each.value.id

  tags = {
    Name        = "${var.environment}-${each.key}-rt"
    Environment = var.environment
  }
}

resource "aws_route" "public_internet_access" {
  for_each               = aws_route_table.public
  route_table_id         = each.value.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[each.key].id
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public[each.value.vpc_key].id
}
