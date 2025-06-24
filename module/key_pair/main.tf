resource "aws_key_pair" "this" {
  for_each   = var.keypairs
  key_name   = each.key
  public_key = each.value.public_key
}

resource "aws_s3_object" "key_file" {
  for_each = var.keypairs

  bucket  = var.bucket_name
  key     = "key/${each.key}.pem"
  content = each.value.private_key

  tags = {
    Name = "${each.key} private key"
  }
}
