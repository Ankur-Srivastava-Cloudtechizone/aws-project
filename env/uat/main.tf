module "vpc" {
  source = "../../module/vpc"

  providers = {
    aws = aws
  }

  vpcs = var.vpcs

  depends_on = [null_resource.wait_for_management]
}
