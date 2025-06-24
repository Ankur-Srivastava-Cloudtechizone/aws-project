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

# variable "execution_roles" {
#   type = map(object({
#     trusted_accounts = list(string)
#   }))
# }

# variable "s3_roles" {
#   type = map(object({
#     trusted_accounts  = list(string)
#     allowed_resources = list(string)
#   }))
# }


# variable "common_tags" {
#   description = "Tags to apply on resources"
#   type        = map(string)
# }


# variable "trust_policies" {
#   description = "Map of trust policies with trusted accounts"
#   type = map(object({
#     trusted_accounts = list(string)
#   }))
# }

# variable "bucket_policies" {
#   type = map(object({
#     bucket_name        = string
#     allowed_principals = list(string)
#   }))
# }


# variable "keypairs" {
#   type = map(object({
#     public_key  = string
#     private_key = string
#   }))
# }

# variable "key_backup_bucket" {
#   type        = string
#   description = "Bucket where private keys will be stored"
# }
