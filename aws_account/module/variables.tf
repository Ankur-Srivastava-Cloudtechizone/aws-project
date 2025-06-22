variable "accounts" {
  description = "Map of AWS accounts to create"
  type = map(object({
    name      = string
    email     = string
    role_name = string
    tags      = map(string)
  }))
}
