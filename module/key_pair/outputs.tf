output "key_names" {
  value = { for k, v in aws_key_pair.this : k => v.key_name }
}
