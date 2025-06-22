variable "accounts" {
  description = "List of AWS accounts to create in organization"
  type = map(object({
    name      = string
    email     = string
    role_name = string
    tags      = map(string)
  }))
}


variable "aws_region" {
  description = "AWS region"
  type        = string
}

