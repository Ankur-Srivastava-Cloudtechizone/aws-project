module "s3" {
  source    = "../../module/s3"
  providers = {
    aws = aws.sharedservices
  }
  buckets          = var.buckets
  organization_id  = var.organization_id
  allowed_roles    = var.allowed_roles
}


# module "transit_gateway_prod" {
#   source = "../../module/transit_gateway"
#   providers = {
#     aws = aws.prod
#   }
#   tgw_name = var.tgw_name
#   vpc_attachments = {
#     prod = {
#       vpc_id     = data.terraform_remote_state.prod.outputs.vpc_ids["prod-vpc"]
#       subnet_ids = [
#         data.terraform_remote_state.prod.outputs.subnet_ids["prod-vpc-public-subnet-1"],
#         data.terraform_remote_state.prod.outputs.subnet_ids["prod-vpc-public-subnet-2"]
#       ]
#     }
#   }
# }

# module "transit_gateway_preprod" {
#   source = "../../module/transit_gateway"
#   providers = {
#     aws = aws.preprod
#   }
#   tgw_name = var.tgw_name
#   vpc_attachments = {
#     preprod = {
#       vpc_id     = data.terraform_remote_state.preprod.outputs.vpc_ids["preprod-vpc"]
#       subnet_ids = [
#         data.terraform_remote_state.preprod.outputs.subnet_ids["preprod-vpc-public-subnet-1"],
#         data.terraform_remote_state.preprod.outputs.subnet_ids["preprod-vpc-public-subnet-2"]
#       ]
#     }
#   }
# }

# Similarly for dev, dr, etc.
