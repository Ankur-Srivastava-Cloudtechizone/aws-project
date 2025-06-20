output "eks_cluster_names" {
  value = { for k, v in aws_eks_cluster.this : k => v.name }
}

output "eks_cluster_endpoints" {
  value = { for k, v in aws_eks_cluster.this : k => v.endpoint }
}
