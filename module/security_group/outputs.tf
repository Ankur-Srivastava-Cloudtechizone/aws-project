output "security_group_ids" {
  value = { for sg_name, sg in aws_security_group.this : sg_name => sg.id }
}
