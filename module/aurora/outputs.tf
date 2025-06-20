output "aurora_endpoints" {
  value = { for k, v in aws_rds_cluster.this : k => v.endpoint }
}

output "aurora_reader_endpoints" {
  value = { for k, v in aws_rds_cluster.this : k => v.reader_endpoint }
}
