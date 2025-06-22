aws_region = "ap-south-1"

accounts = {
  # prod = {
  #   name      = "prod"
  #   email     = "aws-prod@example.com"
  #   role_name = "OrganizationAccountAccessRole"
  #   tags = {
  #     Environment = "prod"
  #     Owner       = "cloud-team"
  #   }
  # }

  
  preprod = {
    name      = "preprod"
    email     = "aws-preprod@example.com"
    role_name = "OrganizationAccountAccessRole"
    tags = {
      Environment = "preprod"
      Owner       = "cloud-team"
    }
  }
  # dev = {
  #   name      = "dev"
  #   email     = "aws-dev@example.com"
  #   role_name = "OrganizationAccountAccessRole"
  #   tags = {
  #     Environment = "dev"
  #     Owner       = "cloud-team"
  #   }
  # }
  # uat = {
  #   name      = "uat"
  #   email     = "aws-uata@example.com"
  #   role_name = "OrganizationAccountAccessRole"
  #   tags = {
  #     Environment = "uat"
  #     Owner       = "cloud-team"
  #   }
  # }
  # dr = {
  #   name      = "dr"
  #   email     = "aws-dr@example.com"
  #   role_name = "OrganizationAccountAccessRole"
  #   tags = {
  #     Environment = "dr"
  #     Owner       = "cloud-team"
  #   }
  # }
  # shared_services = {
  #   name      = "shared-services"
  #   email     = "aws-shareda@example.com"
  #   role_name = "OrganizationAccountAccessRole"
  #   tags = {
  #     Environment = "shared"
  #     Owner       = "cloud-team"
  #   }
  # }
}


