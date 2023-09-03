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
  source = "${get_parent_terragrunt_dir()}/../..//modules/aws/vpn-connection"
}

locals {
  tags = {}
}

inputs = {
  data = [
    {
      vpn_gateway_id      = dependency.vpn_gateway.outputs.vpn_gateway["lorem"]
      customer_gateway_id = dependency.customer_gateway.outputs.customer_gateway["lorem0"]
      type                = "ipsec.1"
      static_routes_only  = false

      tunnel1_preshared_key                = "katana123"
      tunnel1_ike_versions                 = ["ikev2"]
      tunnel1_phase1_dh_group_numbers      = ["14"]
      tunnel1_phase1_encryption_algorithms = ["AES256"]
      tunnel1_phase1_integrity_algorithms  = ["SHA2-256"]

      tunnel2_preshared_key                = "katana123"
      tunnel2_ike_versions                 = ["ikev2"]
      tunnel2_phase1_dh_group_numbers      = ["14"]
      tunnel2_phase1_encryption_algorithms = ["AES256"]
      tunnel2_phase1_integrity_algorithms  = ["SHA2-256"]

      tags = {
        Name = "lorem0"
      }
    }, {
      vpn_gateway_id      = dependency.vpn_gateway.outputs.vpn_gateway["lorem"]
      customer_gateway_id = dependency.customer_gateway.outputs.customer_gateway["lorem1"]
      type                = "ipsec.1"
      static_routes_only  = false

      tunnel1_preshared_key                = "katana123"
      tunnel1_ike_versions                 = ["ikev2"]
      tunnel1_phase1_dh_group_numbers      = ["14"]
      tunnel1_phase1_encryption_algorithms = ["AES256"]
      tunnel1_phase1_integrity_algorithms  = ["SHA2-256"]

      tunnel2_preshared_key                = "katana123"
      tunnel2_ike_versions                 = ["ikev2"]
      tunnel2_phase1_dh_group_numbers      = ["14"]
      tunnel2_phase1_encryption_algorithms = ["AES256"]
      tunnel2_phase1_integrity_algorithms  = ["SHA2-256"]

      tags = {
        Name = "lorem1"
      }
    }
  ]

  tags = local.tags
}

dependency "vpn_gateway" {
  config_path = "${get_terragrunt_dir()}/../vpn-gateway"

  mock_outputs = {
    vpn_gateway = {
      lorem : "mocked"
    }
  }
}

dependency "customer_gateway" {
  config_path = "${get_terragrunt_dir()}/../customer-gateway"

  mock_outputs = {
    customer_gateway = {
      lorem0 : "mocked"
      lorem1 : "mocked"
    }
  }
}