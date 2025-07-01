###VPC

environment = "prod"

vpc_configs = {
  core = {
    cidr_block = "10.1.0.0/16"
  }
  app = {
    cidr_block = "10.2.0.0/16"
  }
}

subnet_configs = {
  public_subnet_1 = {
    vpc_key    = "core"
    cidr_block = "10.1.1.0/24"
    az         = "ap-south-1a"
    type       = "public"
  }
  public_subnet_2 = {
    vpc_key    = "core"
    cidr_block = "10.1.2.0/24"
    az         = "ap-south-1b"
    type       = "public"
  }
  public_subnet_3 = {
    vpc_key    = "app"
    cidr_block = "10.2.1.0/24"
    az         = "ap-south-1a"
    type       = "public"
  }
}


## Keypair

keypair_name   = "darpg-prod-keypair"
keypair_folder = "key-pair"


### Security Group

security_groups = {
  "prod-web-sg" = {
    vpc_id = "vpc-0e5a8391321efc84a"
    ingress_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
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
    vpc_id = "vpc-0e5a8391321efc84a"
    ingress_rules = [
      {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
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



### EC2
subnet_name           = "public-subnet-1"
security_group_name   = "prod-web-sg"

instances = {
  "prod-app-server" = {
    ami_id        = "ami-0b09627181c8d5778"
    instance_type = "t3.micro"
    key_name      = "darpg-prod-keypair"
    instance_name = "prod-app-server"
  }
}
