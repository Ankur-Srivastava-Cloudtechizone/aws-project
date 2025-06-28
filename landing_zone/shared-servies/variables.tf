variable "buckets" {
  description = "List of S3 buckets to create"
  type        = map(object({
    bucket_name = string
    environment = string
  }))
}

variable "organization_id" {
  description = "AWS Organization ID"
  type        = string
}

variable "allowed_roles" {
  description = "List of allowed IAM Role ARNs for other accounts"
  type        = list(string)
}

variable "sharedservices_account_id" {
  description = "Account ID of sharedservices account"
  type        = string
}



variable "tgw_name" {
  description = "Name for the Transit Gateway"
  type        = string
}
variable "vpc_attachments" {
  description = "Map of VPC IDs and subnet IDs for TGW attachments"
  type        = map(object({
    vpc_id     = string
    subnet_ids = list(string)
  }))
}
