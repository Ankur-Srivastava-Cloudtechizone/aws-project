output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}

output "iam_user_password" {
  value     = module.iam_user.console_password
  sensitive = true
}

output "iam_user_name" {
  value = module.iam_user.user_name
}
