output "user_names" {
  value = {
    for k, v in aws_iam_user.this :
    k => v.name
  }
}
