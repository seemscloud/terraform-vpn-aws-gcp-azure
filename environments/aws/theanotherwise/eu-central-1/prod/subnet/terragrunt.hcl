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
  source = "${get_parent_terragrunt_dir()}/../..//modules/aws/subnet"
}

locals {
  tags = {}
}

inputs = {
  data = [
    {
      cidr_block        = "10.200.200.0/24"
      availability_zone = "a"
      vpc_id            = dependency.vpc.outputs.vpc["lorem"]
      tags              = {
        Name = "lorem"
      }
    }
  ]

  tags = local.tags
}

dependency "vpc" {
  config_path = "${get_terragrunt_dir()}/../vpc"
}