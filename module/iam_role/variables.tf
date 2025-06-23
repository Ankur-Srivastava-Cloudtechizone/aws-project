variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "trusted_accounts" {
  description = "List of AWS account ARNs allowed to assume this role"
  type        = list(string)
}
