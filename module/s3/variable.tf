variable "buckets" {
  description = "S3 bucket definitions"
  type = map(object({
    bucket_name = string
    environment = string
  }))
}
