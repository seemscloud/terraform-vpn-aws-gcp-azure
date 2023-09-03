#remote_state {
#  backend = "local"
#
#  config = {
#    path = "${path_relative_to_include()}/terraform.tfstate"
#  }
#
#  generate = {
#    path      = "backend.tf"
#    if_exists = "overwrite"
#  }
#}
#
#include {
#  path = find_in_parent_folders()
#}
#
#terraform {
#  source = "${get_parent_terragrunt_dir()}/../..//modules/gcp/external-vpn-gateway"
#}
#
#locals {
#  tags = {}
#}
#
#inputs = {
#  data = [
#    {
#
#    }
#  ]
#
#  tags = local.tags
#}
#
#dependency "compute_network" {
#  config_path = "${get_terragrunt_dir()}/../compute-network"
#
#  mock_outputs = {
#    compute_network = {
#      lorem : "mocked"
#    }
#  }
#}