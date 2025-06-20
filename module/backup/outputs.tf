output "backup_vault_arns" {
  value = { for k, v in aws_backup_vault.this : k => v.arn }
}

output "backup_plan_ids" {
  value = { for k, v in aws_backup_plan.this : k => v.id }
}
