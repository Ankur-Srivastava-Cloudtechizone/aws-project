variable "accounts" {
  type = map(object({
    name        = string
    email       = string
    parent_id   = string
    environment = string
  }))
}

variable "role_name" {
  description = "IAM Role Name for the new AWS account"
  type        = string
  default     = "OrganizationAccountAccessRole"
}

variable "users" {
  type = map(object({
    user_name  = string
    policy_arn = string
  }))
}
