variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_configs" {
  description = "Map of VPC configs"
  type = map(object({
    cidr_block = string
  }))
}

variable "subnet_configs" {
  description = "Map of subnet configurations"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    public_subnet     = bool
    tags              = map(string)
  }))
}
