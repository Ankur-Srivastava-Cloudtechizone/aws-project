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
  description = "Map of subnet configs"
  type = map(object({
    vpc_key    = string
    cidr_block = string
    az         = string
    type       = string
  }))
}
