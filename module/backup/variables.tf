variable "backup_vaults" {
  description = "Map of AWS Backup vault configurations"
  type = map(object({
    kms_key_arn = string
  }))
}

variable "backup_plans" {
  description = "Map of AWS Backup plan configurations"
  type = map(object({
    backup_vault_name   = string
    schedule_expression = string
    start_window        = number
    completion_window   = number
    lifecycle = object({
      cold_storage_after = number
      delete_after       = number
    })
  }))
}
