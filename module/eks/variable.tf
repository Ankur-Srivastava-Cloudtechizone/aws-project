variable "eks_clusters" {
  description = "Map of EKS clusters with their configurations"
  type = map(object({
    vpc_id         = string
    subnet_ids     = list(string)
    cluster_version = string
  }))
}
