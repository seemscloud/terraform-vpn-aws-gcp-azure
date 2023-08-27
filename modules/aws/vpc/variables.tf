# Base
variable "region_name" {
  type = string
}

# Tags
variable "tags" {
  type = map(string)
}

variable "default_tags" {
  type = map(string)
}

# Data
variable "data" {
  type = list(object({
    cidr_block           = string
    enable_dns_hostnames = bool
    enable_dns_support   = bool
    tags                 = map(string)
  }))
}