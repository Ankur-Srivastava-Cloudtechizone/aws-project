aws_region = "ap-south-1"

env        = "dev"

accounts = {
  dev = {
    email = "dev-team@yourcompany.com"
  }
}




s3_buckets = {
  "darpg-tfstate-bucket" = {
    force_destroy = true
    versioning    = true
  }

  "darpg-logs-bucket" = {
    force_destroy = false
    versioning    = false
  }
}

bucket_name = "darpg-tfstate-bucket"

bucket_policy = {
  Version = "2012-10-17"
  Statement = [
    {
      Effect = "Allow"
      Principal = "*"
      Action = [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:ListBucket"
      ]
      Resource = [
        "arn:aws:s3:::darpg-tfstate-bucket",
        "arn:aws:s3:::darpg-tfstate-bucket/*"
      ]
    }
  ]
}

tags = {
  Environment = "dev"
  Project     = "darpg"
}


#  aws_account_id = "888184096450"

# dynamodb_table_name = "terraform-locks"
# tags = {
#   Environment = "dev"
#   Project     = "darpg"
# }

vpc_config = {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "darpg-vpc"
    Environment = "dev"
  }
}

internet_gateway_tags = {
  Name = "darpg-igw"
}

public_subnets = {
  public1 = {
    cidr_block        = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip     = true
    tags = {
      Name = "darpg-public-subnet-1"
    }
  }
  public2 = {
    cidr_block        = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip     = true
    tags = {
      Name = "darpg-public-subnet-2"
    }
  }
}

route_table_tags = {
  Name = "darpg-public-rt"
}

sg_name        = "darpg-sg"
sg_description = "Allow HTTP, HTTPS and SSH"
sg_tags = {
  Name = "darpg-sg"
}

ingress_rules = {
  ssh = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  http = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  https = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

egress_rules = {
  all = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


instances = {
  ec2_1 = {
    ami                         = "ami-0f5ee92e2d63afc18"
    instance_type               = "t2.micro"
    subnet_name                 = "darpg-public-subnet-1"
    sg_name                     = "darpg-sg"
    associate_public_ip_address = true
    key_name                    = "darpg-key"
    tags = {
      Name        = "darpg-ec2-1"
      Environment = "dev"
    }
  }

  ec2_2 = {
    ami                         = "ami-0f5ee92e2d63afc18"
    instance_type               = "t2.micro"
    subnet_name                 = "darpg-public-subnet-2"
    sg_name                     = "darpg-sg"
    associate_public_ip_address = true
    key_name                    = "darpg-key"
    tags = {
      Name        = "darpg-ec2-2"
      Environment = "dev"
    }
  }

  ec2_3 = {
    ami                         = "ami-0f5ee92e2d63afc18"
    instance_type               = "t2.micro"
    subnet_name                 = "darpg-public-subnet-1"
    sg_name                     = "darpg-sg"
    associate_public_ip_address = true
    key_name                    = "darpg-key"
    tags = {
      Name        = "darpg-ec2-3"
      Environment = "dev"
    }
  }
}





key_name = "darpg-ec2-key"


eks_clusters = {
  "prod-cluster-1" = {
    vpc_id         = "vpc-xxxxxx"
    subnet_ids     = ["subnet-aaaaa", "subnet-bbbbb"]
    cluster_version = "1.29"
  }
  "prod-cluster-2" = {
    vpc_id         = "vpc-yyyyyy"
    subnet_ids     = ["subnet-ccccc", "subnet-ddddd"]
    cluster_version = "1.29"
  }
  "prod-cluster-3" = {
    vpc_id         = "vpc-zzzzzz"
    subnet_ids     = ["subnet-eeee", "subnet-fffff"]
    cluster_version = "1.29"
  }
  "prod-cluster-4" = {
    vpc_id         = "vpc-aaaaaaa"
    subnet_ids     = ["subnet-ggggg", "subnet-hhhhh"]
    cluster_version = "1.29"
  }
  "prod-cluster-5" = {
    vpc_id         = "vpc-bbbbbbb"
    subnet_ids     = ["subnet-iiiii", "subnet-jjjjj"]
    cluster_version = "1.29"
  }
  "prod-cluster-6" = {
    vpc_id         = "vpc-ccccccc"
    subnet_ids     = ["subnet-kkkkk", "subnet-lllll"]
    cluster_version = "1.29"
  }
}


albs = {
  "alb-1" = {
    vpc_id             = "vpc-aaaaaaa"
    subnet_ids         = ["subnet-11111", "subnet-22222"]
    security_group_ids = ["sg-aaaa1111"]
    internal           = false
  }
  "alb-2" = {
    vpc_id             = "vpc-bbbbbbb"
    subnet_ids         = ["subnet-33333", "subnet-44444"]
    security_group_ids = ["sg-bbbb2222"]
    internal           = false
  }
  "alb-3" = {
    vpc_id             = "vpc-ccccccc"
    subnet_ids         = ["subnet-55555", "subnet-66666"]
    security_group_ids = ["sg-cccc3333"]
    internal           = true
  }
  "alb-4" = {
    vpc_id             = "vpc-ddddddd"
    subnet_ids         = ["subnet-77777", "subnet-88888"]
    security_group_ids = ["sg-dddd4444"]
    internal           = false
  }
  "alb-5" = {
    vpc_id             = "vpc-eeeeeee"
    subnet_ids         = ["subnet-99999", "subnet-aaaaa"]
    security_group_ids = ["sg-eeee5555"]
    internal           = true
  }
  "alb-6" = {
    vpc_id             = "vpc-ffffff"
    subnet_ids         = ["subnet-bbbbb", "subnet-ccccc"]
    security_group_ids = ["sg-ffff6666"]
    internal           = false
  }
}


aurora_clusters = {
  "aurora-db-1" = {
    vpc_id                 = "vpc-aaaaaaa"
    subnet_ids             = ["subnet-11111", "subnet-22222"]
    engine_version         = "15.4"
    database_name          = "prod_db1"
    master_username        = "admin"
    master_password        = "StrongPassw0rd1"
    instance_class         = "db.r6g.large"
    backup_retention_period = 7
  }
  "aurora-db-2" = {
    vpc_id                 = "vpc-bbbbbbb"
    subnet_ids             = ["subnet-33333", "subnet-44444"]
    engine_version         = "15.4"
    database_name          = "prod_db2"
    master_username        = "admin"
    master_password        = "StrongPassw0rd2"
    instance_class         = "db.r6g.large"
    backup_retention_period = 7
  }
  # similarly up to "aurora-db-7"
}


backup_vaults = {
  "prod-vault-1" = {
    kms_key_arn = "arn:aws:kms:ap-south-1:xxxxxx:key/yyyyy"
  }
  "prod-vault-2" = {
    kms_key_arn = "arn:aws:kms:ap-south-1:xxxxxx:key/zzzzz"
  }
}

backup_plans = {
  "daily-backup" = {
    backup_vault_name   = "prod-vault-1"
    schedule_expression = "cron(0 5 * * ? *)"
    start_window        = 60
    completion_window   = 180
    lifecycle = {
      cold_storage_after = 30
      delete_after       = 365
    }
  }
  "weekly-backup" = {
    backup_vault_name   = "prod-vault-2"
    schedule_expression = "cron(0 5 ? * SUN *)"
    start_window        = 60
    completion_window   = 180
    lifecycle = {
      cold_storage_after = 60
      delete_after       = 730
    }
  }
}

ecr_repositories = {
  "prod-ecr-repo" = {
    image_tag_mutability = "MUTABLE"
    scan_on_push         = true
  }
}

connections = {
  "prod-dx-1" = {
    location  = "EqDC2"
    bandwidth = "1Gbps"
  }
}

virtual_interfaces = {
  "prod-dx-vif-1" = {
    connection_id     = "dxcon-xxxxxxx"
    name              = "prod-dx-vif-1"
    vlan              = 101
    address_family    = "ipv4"
    bgp_asn           = 65000
    customer_address  = "175.45.1.2/30"
    amazon_address    = "175.45.1.1/30"
    vpn_gateway_id    = "vgw-xxxxxxxx"
  }
}




