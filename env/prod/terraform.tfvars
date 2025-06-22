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
