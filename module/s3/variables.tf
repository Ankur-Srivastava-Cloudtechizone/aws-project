variable "buckets" {
  description = "List of S3 buckets to create"
  type        = map(object({
    bucket_name = string
    environment = string
  }))
}

variable "allowed_roles" {
  description = "List of allowed IAM Role ARNs for other accounts"
  type        = list(string)
  default     = [
    "arn:aws:iam::102800182323:role/OrganizationAccountAccessRole",
    "arn:aws:iam::855407392432:role/OrganizationAccountAccessRole",
    "arn:aws:iam::987626324847:role/OrganizationAccountAccessRole"
  ]
}
