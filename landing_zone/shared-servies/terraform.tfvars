buckets = {
  "central-backup-bucket" = {
    bucket_name = "darpg-shared-backup-central"
    environment = "sharedservices"
  }

}


### Transit Gateway

tgw_name = "darpg-central-tgw"

vpc_attachments = {
  prod = {
    vpc_id     = "placeholder"
    subnet_ids = ["placeholder-1", "placeholder-2"]
  }
  preprod = {
    vpc_id     = "NA"
    subnet_ids = ["NA-1", "NA-2"]
  }
  # dev = {
  #   vpc_id     = "none"
  #   subnet_ids = ["none"]
  # }
  # dr = {
  #   vpc_id     = "will-be-overridden"
  #   subnet_ids = ["override-this"]
  # }
}
