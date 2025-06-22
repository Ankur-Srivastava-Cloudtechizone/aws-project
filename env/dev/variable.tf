variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "accounts" {
  description = "Map of accounts to create"
  type = map(object({
    email = string
  }))
}

# variable "accounts" {
#   description = "Map of environment to AWS Account IDs"
#   type        = map(string)
# }

variable "env" {
  description = "Environment name like dev, prod, dr"
  type        = string
}



variable "s3_buckets" {
  description = "Map of S3 buckets to provision"
  type = map(object({
    force_destroy = bool
    versioning    = bool
  }))
}

# variable "aws_account_id" {
#   description = "AWS Account ID"
#   type        = string
# }


# variable "dynamodb_table_name" {
#   type        = string
#   description = "The name of the DynamoDB table to be used for state locking."
# }

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the DynamoDB table."
  default     = {}
}

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket for Terraform state"
}

variable "bucket_policy" {
  description = "Policy document for S3 bucket"
  type        = any
}

# for VPC 
variable "vpc_config" {
  description = "VPC configuration"
  type = object({
    cidr_block           = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
    tags                 = map(string)
  })
}

variable "internet_gateway_tags" {
  description = "Tags for Internet Gateway"
  type        = map(string)
}

variable "public_subnets" {
  description = "Map of public subnet configurations"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    map_public_ip     = bool
    tags              = map(string)
  }))
}

variable "route_table_tags" {
  description = "Tags for route table"
  type        = map(string)
}


variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}

variable "sg_tags" {
  type = map(string)
}

variable "ingress_rules" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}


variable "instances" {
  description = "EC2 instance configurations"
  type = map(object({
    ami                         = string
    instance_type               = string
    subnet_name                 = string           # ✅ Required
    sg_name                     = string           # ✅ Required
    associate_public_ip_address = bool
    key_name                    = string
    tags                        = map(string)
  }))
}

variable "key_name" {
  description = "Key name to associate with the EC2 instance"
  type        = string
}


variable "eks_clusters" {
  description = "Map of EKS cluster configs"
  type = map(object({
    vpc_id         = string
    subnet_ids     = list(string)
    cluster_version = string
  }))
}


variable "albs" {
  description = "Map of ALB configurations"
  type = map(object({
    vpc_id             = string
    subnet_ids         = list(string)
    security_group_ids = list(string)
    internal           = bool
  }))
}


variable "aurora_clusters" {
  description = "Map of Aurora cluster configs"
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

variable "ecr_repositories" {
  description = "Map of ECR repository configurations"
  type = map(object({
    image_tag_mutability = string
    scan_on_push         = bool
  }))
}


variable "connections" {
  description = "Map of Direct Connect connections"
  type = map(object({
    location  = string
    bandwidth = string
  }))
}

variable "virtual_interfaces" {
  description = "Map of Direct Connect virtual interfaces"
  type = map(object({
    connection_id     = string
    name              = string
    vlan              = number
    address_family    = string
    bgp_asn           = number
    customer_address  = string
    amazon_address    = string
    vpn_gateway_id    = string
  }))
}
