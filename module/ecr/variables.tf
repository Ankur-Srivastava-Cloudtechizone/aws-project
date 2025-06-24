variable "ecr_repositories" {
  description = "Map of ECR repository configurations"
  type = map(object({
    image_tag_mutability = string
    scan_on_push         = bool
  }))
}
