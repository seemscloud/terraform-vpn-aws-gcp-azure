# Defaults
variable "region_name" {
  type = string
}

# Inputs
variable "inputs" {
  type = list(object({
    cidr_block           = string
    enable_dns_hostnames = bool
    enable_dns_support   = bool
    tags                 = map(string)
  }))
}

# Tags
variable "tags" {
  type = map(string)
}

variable "default_tags" {
  type = map(string)
}