environment = "prod"

vpc_cidr_block = "10.1.0.0/16"

subnet_configs = {
  "public-subnet-1" = {
    cidr_block        = "10.1.1.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      Type = "private"
    }
  }
  "public-subnet-2" = {
    cidr_block        = "10.1.2.0/24"
    availability_zone = "ap-south-1b"
    tags = {
      Type = "private"
    }
  }
}

tags = {
  Project = "DARPG"
}

keypair_name   = "darpg-prod-keypair"
keypair_folder = "key-pair"

security_groups = {
  "prod-web-sg" = {
    ingress_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["10.1.0.0/16"]
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }

  "prod-db-sg" = {
    ingress_rules = [
      {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["10.1.0.0/16"]
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
}

instances = {
  "prod-app-server" = {
    ami_id        = "ami-0b09627181c8d5778"
    instance_type = "t3.micro"
    key_name      = "darpg-prod-keypair"
    instance_name = "prod-app-server"
  }
}
