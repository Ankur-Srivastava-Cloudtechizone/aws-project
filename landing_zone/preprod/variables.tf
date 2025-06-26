variable "vpcs" {
  type = map(object({
    cidr_block = string
    subnets = map(object({
      cidr_block        = string
      availability_zone = string
    }))
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

