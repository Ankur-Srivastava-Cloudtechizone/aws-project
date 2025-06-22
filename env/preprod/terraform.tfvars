aws_region = "ap-south-1"

role_name            = "TerraformExecutionRole"
trusted_account_arn  = "arn:aws:iam::979156606832:root"

user_name        = "preprod-admin"
console_password = "Your$SecurePassword123"


vpc_name   = "darpg-preprod-vpc"
cidr_block = "10.0.0.0/16"
azs        = ["ap-south-1a", "ap-south-1b"]
