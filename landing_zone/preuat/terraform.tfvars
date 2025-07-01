vpcs = {
  "preuat-vpc" = {
    cidr_block = "192.168.0.0/16"
    subnets = {
      "public-subnet-1" = {
        cidr_block        = "192.168.1.0/24"
        availability_zone = "ap-south-1a"
      }
      "public-subnet-2" = {
        cidr_block        = "192.168.2.0/24"
        availability_zone = "ap-south-1b"
      }
      # "public-subnet-3" = {
      #   cidr_block        = "192.168.3.0/24"
      #   availability_zone = "ap-south-1c"
      # }
    }
  }
}

## Keypair

keypair_name   = "darpg-preuat-keypair"
keypair_folder = "key-pair"


### Security Group

security_groups = {
  "preuat-web-sg" = {
    vpc_id = "vpc-0e5a8391321efc84a"
    ingress_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["192.168.0.0/16"]
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

  "preuat-db-sg" = {
    vpc_id = "vpc-0e5a8391321efc84a"
    ingress_rules = [
      {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["192.168.0.0/16"]
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
security_group_name   = "preuat-web-sg"

instances = {
  "prod-app-server" = {
    ami_id        = "ami-0b09627181c8d5778"
    instance_type = "t3.micro"
    key_name      = "darpg-preuat-keypair"
    instance_name = "preuat-app-server"
  }
}
