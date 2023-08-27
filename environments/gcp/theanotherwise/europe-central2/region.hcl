locals {
  region_name = "europe-central2"
}

inputs = {
  region_name  = local.region_name
  default_tags = {
    Region = local.region_name
  }
}