variable "albs" {
  description = "Map of ALB configurations"
  type = map(object({
    vpc_id             = string
    subnet_ids         = list(string)
    security_group_ids = list(string)
    internal           = bool
  }))
}
