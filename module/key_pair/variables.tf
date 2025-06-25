variable "keypair_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name to store keypair"
  type        = string
}

variable "folder_name" {
  description = "Folder name inside bucket to store keypair"
  type        = string
}
