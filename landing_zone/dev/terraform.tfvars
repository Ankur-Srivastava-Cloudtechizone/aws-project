environment = "dev"

vpc_cidr_block = "10.1.0.0/16"

subnet_configs = {
  "dev-public-subnet-1" = {
    cidr_block        = "10.1.1.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      Type = "private"
    }
  }
  "dev-public-subnet-2" = {
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

keypair_name   = "darpg-dev-keypair"
keypair_folder = "key-pair"

security_groups = {
  "dev-web-sg" = {
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

  "dev-db-sg" = {
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

ec2_instances = {
  "web-server-1" = {
    ami                 = "ami-0d03cb826412c6b0f"
    instance_type       = "t3.micro"
    subnet_logical_name = "dev-public-subnet-1"
    sg_names            = ["dev-web-sg", "dev-db-sg"]
  }
}

