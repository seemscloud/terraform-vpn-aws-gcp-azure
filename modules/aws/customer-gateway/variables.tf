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
    bgp_asn    = number
    ip_address = string
    type       = string
    tags       = map(string)
  }))
}