resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  tags = merge({
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }, var.tags)
}

resource "aws_subnet" "private" {
  for_each = var.subnet_configs

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = merge({
    Name        = "${var.environment}-subnet-${each.key}"
    Environment = var.environment
  }, each.value.tags)
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge({
    Name        = "${var.environment}-igw"
    Environment = var.environment
  }, var.tags)
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge({
    Name        = "${var.environment}-rt"
    Environment = var.environment
  }, var.tags)
}

resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "private_subnet" {
  for_each = aws_subnet.private

  subnet_id      = each.value.id
  route_table_id = aws_route_table.this.id
}
