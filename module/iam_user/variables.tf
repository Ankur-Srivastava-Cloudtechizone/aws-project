variable "users" {
  description = "IAM Users to create"
  type = map(object({
    user_name  = string
    policy_arn = string
  }))
}
