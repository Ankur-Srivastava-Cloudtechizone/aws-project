variable "tgw_name" {
  description = "Name of Transit Gateway"
  type        = string
}

variable "vpc_attachments" {
  description = "Map of VPC attachments with vpc_id and subnet_ids"
  type = map(object({
    vpc_id     = string
    subnet_ids = list(string)
  }))
}
