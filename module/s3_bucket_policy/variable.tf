variable "bucket_name" {
  type = string
}

variable "allowed_principals" {
  type = list(string)
}

# optional if you want external dependency
# variable "depends_on_bucket" {
#   description = "Optional dependency on bucket creation"
#   type        = list(any)
#   default     = []
# }
variable "bucket_policies" {
  type = map(object({
    bucket_name        = string
    allowed_principals = list(string)
  }))
}
