resource "aws_rds_cluster_subnet_group" "this" {
  for_each = var.aurora_clusters

  name       = "${each.key}-subnet-group"
  subnet_ids = each.value.subnet_ids
}

resource "aws_rds_cluster" "this" {
  for_each = var.aurora_clusters

  cluster_identifier      = each.key
  engine                  = "aurora-postgresql"
  engine_version          = each.value.engine_version
  database_name           = each.value.database_name
  master_username         = each.value.master_username
  master_password         = each.value.master_password
  backup_retention_period = each.value.backup_retention_period
  db_subnet_group_name    = aws_rds_cluster_subnet_group.this[each.key].name
  vpc_security_group_ids  = []
}

resource "aws_rds_cluster_instance" "this" {
  for_each              = var.aurora_clusters

  identifier            = "${each.key}-instance"
  cluster_identifier    = aws_rds_cluster.this[each.key].id
  instance_class        = each.value.instance_class
  engine                = "aurora-postgresql"
}
