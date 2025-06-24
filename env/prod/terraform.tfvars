###VPC

vpcs = {
  "prod-vpc" = {
    cidr_block = "10.0.0.0/16"
    subnets = {
      "public-subnet-1" = {
        cidr_block        = "10.0.1.0/24"
        availability_zone = "ap-south-1a"
      }
      "public-subnet-2" = {
        cidr_block        = "10.0.2.0/24"
        availability_zone = "ap-south-1b"
      }
    }
  }
}

### Keypair

# keypairs = {
#   "prod-key1" = { s3_bucket = "darpg-prod-key-bucket" }
#   "prod-key2" = { s3_bucket = "darpg-prod-key-bucket" }
# }


### Security Group

security_groups = {
  "prod-sg1" = {
    vpc_name = "prod-vpc"
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  "prod-sg2" = {
    vpc_name = "prod-vpc"
    ingress_rules = [
      { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
}


### EC2

instances = {
  "prod-ec2-1" = {
    ami_id        = "ami-0abcdef1234567890"
    subnet_id     = "subnet-023c648a8675008e9"
    sg_ids        = ["sg-0a123456789abcdef"]
    instance_type = "t3.micro"
    key_name      = "prod-key1"
  },
  "prod-ec2-2" = {
    ami_id        = "ami-0abcdef1234567890"
    subnet_id     = "subnet-0db76d3b8fba41f0e"
    sg_ids        = ["sg-0a123456789abcdef"]
    instance_type = "t3.micro"
    key_name      = "prod-key2"
  }
}
