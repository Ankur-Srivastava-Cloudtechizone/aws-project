resource "tls_private_key" "ec2_keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_keypair" {
  key_name   = var.keypair_name
  public_key = tls_private_key.ec2_keypair.public_key_openssh
}

resource "aws_s3_object" "ec2_private_key" {
  bucket = var.s3_bucket_name
  key    = "${var.folder_name}/${var.keypair_name}.pem"
  content = tls_private_key.ec2_keypair.private_key_pem

  server_side_encryption = "AES256"
}
