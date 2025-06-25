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
variable "instances" {}

variable "keypairs" {
  description = "Map of key pair definitions"
  type = map(object({
    public_key  = string
    private_key = string
  }))
}

variable "bucket_name" {
  description = "S3 bucket name for storing private keys"
  type        = string
}
