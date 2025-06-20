resource "aws_eks_cluster" "this" {
  for_each = var.eks_clusters

  name     = each.key
  role_arn = aws_iam_role.eks_role.arn
  version  = each.value.cluster_version

  vpc_config {
    subnet_ids = each.value.subnet_ids
  }

  depends_on = [aws_iam_role.eks_role]
}

resource "aws_iam_role" "eks_role" {
  for_each = var.eks_clusters

  name = "${each.key}-eks-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}
