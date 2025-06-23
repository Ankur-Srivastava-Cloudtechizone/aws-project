variable "instances" {
  description = "Map of EC2 instance configs"
  type = map(object({
    ami_id       = string
    subnet_id    = string
    sg_ids       = list(string)
    instance_type = string
    key_name     = string
  }))
}
