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
  source = "${get_parent_terragrunt_dir()}/../..//modules/aws/customer-gateway"
}

locals {
  tags = {}
}

inputs = {
  data = [
    {
      bgp_asn    = 65000
      ip_address = dependency.ha_vpn_gateway.outputs.ha_vpn_gateway["lorem"][0].ip_address
      type       = "ipsec.1"
      tags       = {
        Name = "lorem0"
      }
    }, {
      bgp_asn    = 65000
      ip_address = dependency.ha_vpn_gateway.outputs.ha_vpn_gateway["lorem"][1].ip_address
      type       = "ipsec.1"
      tags       = {
        Name = "lorem1"
      }
    }
  ]

  tags = local.tags
}

dependency "ha_vpn_gateway" {
  config_path = "${get_terragrunt_dir()}/../../../../../gcp/theanotherwise/europe-central2/prod/ha-vpn-gateway"

  mock_outputs = {
    ha_vpn_gateway = {
      lorem : "mocked"
    }
  }
}