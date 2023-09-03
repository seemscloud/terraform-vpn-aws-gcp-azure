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
  source = "${get_parent_terragrunt_dir()}/../..//modules/gcp/ha-vpn-gateway"
}

locals {
  tags = {}
}

inputs = {
  data = [
    {
      name       = "lorem"
      stack_type = "IPV4_IPV6"
      network_id = dependency.compute_network.outputs.compute_network["lorem"]
    }
  ]

  tags = local.tags
}

dependency "compute_network" {
  config_path = "${get_terragrunt_dir()}/../compute-network"

  mock_outputs = {
    compute_network = {
      lorem : "mocked"
    }
  }
}