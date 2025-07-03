variable "vpcs" {
  type = map(object({
    cidr_block = string
    subnets = map(object({
      cidr_block        = string
      availability_zone = string
    }))
  }))
}

variable "keypairs" {}
variable "security_groups" {}
variable "instances" {}
