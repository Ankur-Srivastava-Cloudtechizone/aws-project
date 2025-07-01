variable "environment" {
  description = "The environment name (e.g. dev, preprod, prod)"
  type        = string
}

variable "vpc_configs" {
  description = "Map of VPC configurations"
  type = map(object({
    cidr_block           = string
    enable_dns_hostnames = bool
    enable_dns_support   = bool
    tags                 = map(string)
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


variable "security_groups" {}


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

