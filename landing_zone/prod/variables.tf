variable "environment" {
  description = "The environment name (e.g. dev, preprod, prod)"
  type        = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "subnet_configs" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    tags              = map(string)
  }))
}

variable "tags" {
  type = map(string)
}

variable "security_groups" {
  description = "Map of security groups"
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

variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}



variable "keypair_name" {
  description = "Name of EC2 key pair"
  type        = string
}

variable "keypair_folder" {
  description = "Folder name inside s3 bucket"
  type        = string
}


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

