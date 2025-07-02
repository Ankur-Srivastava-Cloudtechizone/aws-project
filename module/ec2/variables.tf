variable "instances" {
  description = "Map of EC2 instances to launch"
  type = map(object({
    ami_id        = string
    instance_type = string
    key_name      = string
    instance_name = string
  }))
}

variable "subnet_id" {
  description = "ID of the subnet to launch the EC2 instance in"
  type        = string
}

variable "security_group_id" {
  description = "ID of the security group to attach to the EC2 instance"
  type        = string
}
