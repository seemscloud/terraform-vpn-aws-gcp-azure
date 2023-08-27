locals {
  account_name = "theanotherwise"
}

inputs = {
  account_name = local.account_name
  default_tags = {
    Account = local.account_name
  }
}
