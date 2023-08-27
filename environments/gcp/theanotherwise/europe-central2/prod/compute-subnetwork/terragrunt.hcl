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
  source = "${get_parent_terragrunt_dir()}/../..//modules/gcp/compute-subnetwork"
}

locals {
  tags = {}
}

inputs = {
  data = [
    {
      name          = "bastion"
      ip_cidr_range = "10.100.100.0/24"
      network_id    = dependency.compute_nnetwork.outputs.compute_network["lorem"]
    }
  ]

  tags = local.tags
}

dependency "compute_nnetwork" {
  config_path = "${get_terragrunt_dir()}/../compute-network"
}