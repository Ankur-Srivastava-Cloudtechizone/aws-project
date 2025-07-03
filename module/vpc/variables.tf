variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "environment" {
  description = "Environment name (prod/preprod/dev)"
  type        = string
}

variable "subnet_configs" {
  description = "Map of subnet configs"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    tags              = map(string)
  }))
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}
