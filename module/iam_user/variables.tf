variable "users" {
  type = map(object({
    user_name  = string
    policy_arn = string
  }))
}
