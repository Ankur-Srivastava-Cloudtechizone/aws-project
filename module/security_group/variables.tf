variable "vpc_id" {
  description = "VPC ID for security groups"
  type        = string
}

variable "security_groups" {
  description = "Map of security groups with their ingress and egress rules"
  type = map(object({
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
