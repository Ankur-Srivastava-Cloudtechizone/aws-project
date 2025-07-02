variable "security_groups" {
  description = "Map of security groups to create"
  type = map(object({
    vpc_id        = string
    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
}
variable "vpc_id" {
  description = "VPC ID for security groups"
  type        = string
}
