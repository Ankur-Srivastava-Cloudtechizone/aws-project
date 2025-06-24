variable "keypairs" {
  description = "Map of key pair definitions"
  type = map(object({
    public_key  = string
    private_key = string
  }))
}

variable "bucket_name" {
  description = "S3 bucket name for storing private keys"
  type        = string
}
