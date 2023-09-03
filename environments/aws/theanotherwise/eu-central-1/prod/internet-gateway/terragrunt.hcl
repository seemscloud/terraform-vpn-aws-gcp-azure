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
  source = "${get_parent_terragrunt_dir()}/../..//modules/aws/internet-gateway"
}

locals {
  tags = {}
}

inputs = {
  data = [
    {
      vpc_id = dependency.vpc.outputs.vpc["lorem"]
      tags   = {
        Name = "lorem-internet-gateway"
      }
    }
  ]

  tags = local.tags
}

dependency "vpc" {
  config_path = "${get_terragrunt_dir()}/../vpc"

  mock_outputs = {
    vpc = {
      lorem : "mocked"
    }
  }
}