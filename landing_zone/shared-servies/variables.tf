variable "buckets" {
  type = map(object({
    bucket_name = string
    environment = string
  }))
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
