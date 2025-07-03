resource "aws_instance" "this" {
  provider = aws
  for_each = var.ec2_instances

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  key_name               = each.value.key_name
  vpc_security_group_ids = each.value.security_group_ids

  tags = {
    Name        = "${each.key}"
    Environment = var.environment
    Project     = "DARPG"
  }
}
