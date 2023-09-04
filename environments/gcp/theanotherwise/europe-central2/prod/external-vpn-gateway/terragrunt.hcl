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
  source = "${get_parent_terragrunt_dir()}/../..//modules/gcp/external-vpn-gateway"
}

locals {
  tags = {}
}

inputs = {
  data = [
    {
      name            = "lorem"
      redundancy_type = "FOUR_IPS_REDUNDANCY"
      interfaces      = concat(
        dependency.vpn_connection.outputs.vpn_connection["lorem0"],
        dependency.vpn_connection.outputs.vpn_connection["lorem1"]
      )
    }
  ]

  tags = local.tags
}

dependency "vpn_connection" {
  config_path = "${get_terragrunt_dir()}/../../../../../aws/theanotherwise/eu-central-1/prod/vpn-connection"

  mock_outputs = {
    vpc = {
      lorem : "mocked"
    }
  }
}