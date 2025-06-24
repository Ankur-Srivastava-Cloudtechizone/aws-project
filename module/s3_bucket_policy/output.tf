output "bucket_policy_ids" {
  value = { for k, v in aws_s3_bucket_policy.this : k => v.id }
}
