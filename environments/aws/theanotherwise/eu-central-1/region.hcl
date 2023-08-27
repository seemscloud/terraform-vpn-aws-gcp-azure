locals {
  region_name = "eu-central-1"
}

inputs = {
  region_name  = local.region_name
  default_tags = {
    Region = local.region_name
  }
}