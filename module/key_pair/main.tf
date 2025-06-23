resource "tls_private_key" "this" {
  for_each = var.keypairs
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  for_each   = var.keypairs
  key_name   = each.key
  public_key = tls_private_key.this[each.key].public_key_openssh
}

resource "aws_s3_object" "key_file" {
  for_each    = var.keypairs
  bucket      = each.value.s3_bucket
  key         = "${each.key}.pem"
  content     = tls_private_key.this[each.key].private_key_pem
  content_type = "text/plain"
}
