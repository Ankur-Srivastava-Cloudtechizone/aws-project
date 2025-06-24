variable "connections" {
  description = "Map of Direct Connect connections"
  type = map(object({
    location  = string
    bandwidth = string
  }))
}

variable "virtual_interfaces" {
  description = "Map of Direct Connect virtual interfaces"
  type = map(object({
    connection_id     = string
    name              = string
    vlan              = number
    address_family    = string
    bgp_asn           = number
    customer_address  = string
    amazon_address    = string
    vpn_gateway_id    = string
  }))
}
