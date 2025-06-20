output "alb_dns_names" {
  value = { for k, v in aws_lb.this : k => v.dns_name }
}
