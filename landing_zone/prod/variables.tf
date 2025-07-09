# VPC variables
variable "environment" {
  description = "The environment name (e.g. dev, preprod, prod)"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_configs" {
  description = "Configuration for subnets"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    tags              = map(string)
  }))
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}

# Key Pair variables
variable "keypair_name" {
  description = "Name of EC2 key pair"
  type        = string
}

variable "keypair_folder" {
  description = "Folder name inside S3 bucket for keypair"
  type        = string
}

# Security Group variables
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

# EC2 instances variables
variable "ec2_instances" {
  description = "EC2 instance configurations"
  type = map(object({
    ami                 = string
    instance_type       = string
    subnet_logical_name = string
    sg_names            = list(string)
  }))
}


variable "lambda_functions" {
  type = map(object({
    function_name        = string
    handler              = string
    runtime              = string
    timeout              = number
    memory_size          = number
    zip_path             = string
    role_name            = string
    environment_variables = map(string)
  }))
}