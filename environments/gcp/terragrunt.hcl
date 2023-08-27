locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  project_vars     = read_terragrunt_config(find_in_parent_folders("project.hcl"))
}

inputs = merge(
  local.environment_vars.inputs,
  local.region_vars.inputs,
  local.project_vars.inputs,
  {
    default_tags = merge(
      local.environment_vars.inputs.default_tags,
      local.region_vars.inputs.default_tags,
      local.project_vars.inputs.default_tags
    )
  }
)
