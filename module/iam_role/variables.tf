variable "roles" {
  type = map(object({
    name               = string
    assume_role_policy = string
    policy_arn         = string
  }))
}
