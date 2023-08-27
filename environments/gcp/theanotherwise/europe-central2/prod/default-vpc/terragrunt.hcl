remote_state {
  backend = "local"

  config = {
    path = "${path_relative_to_include()}/terraform.tfstate"
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
}

include {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/../..//modules/gcp/vpc"
}

locals {
  tags = {}

  inputs = read_terragrunt_config("inputs.hcl")
}

inputs = {
  inputs = local.inputs.inputs.vpc

  tags = local.tags
}
