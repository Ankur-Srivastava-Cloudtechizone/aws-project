resource "aws_ec2_transit_gateway" "this" {
  description = "DARPG Central Transit Gateway"
  tags = {
    Name = var.tgw_name
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  for_each = var.vpc_attachments

  subnet_ids         = each.value.subnet_ids
  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = each.value.vpc_id

  tags = {
    Name = "${each.key}-tgw-attachment"
  }
}
