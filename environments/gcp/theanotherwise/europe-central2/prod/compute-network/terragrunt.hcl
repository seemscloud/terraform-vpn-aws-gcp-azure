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
  source = "${get_parent_terragrunt_dir()}/../..//modules/gcp/compute-network"
}

locals {
  tags = {}
}

inputs = {
  data = [
    {
      name                    = "lorem"
      auto_create_subnetworks = false
      mtu                     = 1460
    }
  ]

  tags = local.tags
}
