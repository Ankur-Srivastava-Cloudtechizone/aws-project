# variables.tf
variable "accounts" {
  type = map(object({
    email = string
    name  = string
  }))
}

variable "users" {
  type = map(object({
    user_name  = string
    policy_arn = string
  }))
}

variable "role_name" {
  description = "The role name to assume in each target account"
  type        = string
  default     = "OrganizationAccountAccessRole"
}
