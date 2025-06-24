resource "aws_instance" "this" {
  for_each                    = var.instances
  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  subnet_id                   = each.value.subnet_id
  vpc_security_group_ids      = each.value.vpc_security_group_ids
  key_name                    = each.value.key_name
  associate_public_ip_address = true

  tags = {
    Name = each.key
  }
}

