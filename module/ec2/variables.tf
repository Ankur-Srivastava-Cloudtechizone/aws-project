variable "instances" {
  type = map(object({
    ami_id             = string
    instance_type      = string
    key_name           = string
    instance_name      = string
  }))
}

variable "subnet_name" {
  description = "Name tag of the subnet"
  type        = string
}

variable "security_group_name" {
  description = "Name tag of the security group"
  type        = string
}
