variable "aurora_clusters" {
  description = "Map of Aurora cluster configurations"
  type = map(object({
    vpc_id                 = string
    subnet_ids             = list(string)
    engine_version         = string
    database_name          = string
    master_username        = string
    master_password        = string
    instance_class         = string
    backup_retention_period = number
  }))
}
