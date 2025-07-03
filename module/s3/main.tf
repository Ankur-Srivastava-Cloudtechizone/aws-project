resource "aws_s3_bucket" "this" {
  provider = aws
  for_each = var.buckets

  bucket = each.value.bucket_name

  tags = {
    Name        = each.value.bucket_name
    Environment = each.value.environment
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  provider = aws
  for_each = aws_s3_bucket.this

  bucket = each.value.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "this" {
  provider = aws
  for_each = aws_s3_bucket.this

  bucket = each.value.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [

      {
        Sid    = "AllowTerraformStateAccess",
        Effect = "Allow",
        Principal = {
          AWS = [
            "arn:aws:iam::134449592952:user/ankursrivastava"
          ]
        },
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        Resource = [
          "${aws_s3_bucket.this[each.key].arn}",
          "${aws_s3_bucket.this[each.key].arn}/*"
        ]
      },

      {
        Sid    = "AllowAccountRolesAccessForBucket",
        Effect = "Allow",
        Principal = {
          AWS = var.allowed_roles
        },
        Action = [
          "s3:ListBucket",
          "s3:GetBucketVersioning"
        ],
        Resource = "${aws_s3_bucket.this[each.key].arn}"
      },

      {
        Sid    = "AllowAccountRolesAccessForObjects",
        Effect = "Allow",
        Principal = {
          AWS = var.allowed_roles
        },
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:GetObjectTagging",
          "s3:DeleteObject"
        ],
        Resource = "${aws_s3_bucket.this[each.key].arn}/*"
      },

      {
        Sid    = "AllowOrganizationAccess",
        Effect = "Allow",
        Principal = "*",
        Action = "s3:*",
        Resource = [
          "${aws_s3_bucket.this[each.key].arn}",
          "${aws_s3_bucket.this[each.key].arn}/*"
        ],
        Condition = {
          StringEquals = {
            "aws:PrincipalOrgID" = var.organization_id
          }
        }
      }

    ]
  })
}
