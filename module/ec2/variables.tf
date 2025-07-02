variable "environment" {
  description = "Environment name"
  type        = string
}

variable "ec2_instances" {
  type = map(object({
    ami                  = string
    instance_type        = string
    subnet_id            = string
    key_name             = string
    security_group_ids   = list(string)
  }))
}
