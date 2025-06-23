variable "keypairs" {
  description = "Map of keypair names and their S3 bucket"
  type = map(object({
    s3_bucket = string
  }))
}
