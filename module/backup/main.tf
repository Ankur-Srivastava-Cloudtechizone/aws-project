resource "aws_backup_vault" "this" {
  provider = aws
  for_each = var.backup_vaults

  name        = each.key
  kms_key_arn = each.value.kms_key_arn

  tags = {
    Name = each.key
  }
}

resource "aws_backup_plan" "this" {
  provider = aws
  for_each = var.backup_plans

  name = each.key

  rule {
    rule_name         = "${each.key}-rule"
    target_vault_name = each.value.backup_vault_name
    schedule          = each.value.schedule_expression
    start_window      = each.value.start_window
    completion_window = each.value.completion_window

    lifecycle {
      cold_storage_after = each.value.lifecycle.cold_storage_after
      delete_after       = each.value.lifecycle.delete_after
    }
  }
}
