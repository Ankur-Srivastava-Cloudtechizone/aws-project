variable "vpcs" {
  description = "VPC and Subnet definitions"
  type = map(object({
    cidr_block = string
    subnets = map(object({
      cidr_block        = string
      availability_zone = string
    }))
  }))
}
