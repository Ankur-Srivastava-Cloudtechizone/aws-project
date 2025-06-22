variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "user_name" {
  description = "IAM user name"
  type        = string
}
variable "console_password" {}

variable "role_name" {
  description = "Name of the IAM Role"
  type        = string
}

variable "trusted_account_arn" {
  description = "Trusted account ARN"
  type        = string
}


variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block"
  type        = string
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}
