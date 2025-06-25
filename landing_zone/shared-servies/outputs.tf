output "bucket_names" {
  value = module.s3.bucket_names
}

output "central_backup_bucket_name" {
  value = module.s3.bucket_names["central-backup-bucket"]
}
