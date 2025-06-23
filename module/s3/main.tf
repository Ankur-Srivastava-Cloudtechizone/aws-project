resource "aws_s3_bucket" "this" {
  for_each = var.buckets

  bucket = each.value.bucket_name

  tags = {
    Name        = each.value.bucket_name
    Environment = each.value.environment
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  for_each = aws_s3_bucket.this

  bucket = each.value.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
