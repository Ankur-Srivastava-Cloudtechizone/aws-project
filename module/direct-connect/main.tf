resource "aws_dx_connection" "this" {
  provider = aws
  for_each = var.connections

  name      = each.key
  bandwidth = each.value.bandwidth
  location  = each.value.location

  tags = {
    Name = each.key
  }
}

resource "aws_dx_private_virtual_interface" "this" {
  provider = aws
  for_each = var.virtual_interfaces

  name             = each.value.name
  connection_id    = each.value.connection_id
  vlan             = each.value.vlan
  address_family   = each.value.address_family
  bgp_asn          = each.value.bgp_asn
  customer_address = each.value.customer_address
  amazon_address   = each.value.amazon_address
  vpn_gateway_id   = each.value.vpn_gateway_id

  tags = {
    Name = each.value.name
  }
}
