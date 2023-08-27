locals {
  project_name         = "theanotherwise"
  credentials_filename = "gcp-theanotherwise.json"
}

inputs = {
  project_name         = local.project_name
  credentials_filename = local.credentials_filename
  default_tags         = {
    Account = local.project_name
  }
}