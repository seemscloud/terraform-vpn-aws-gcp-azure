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
    vpn_gateway_id      = string
    customer_gateway_id = string
    type                = string
    static_routes_only  = bool

    tunnel1_preshared_key                = string
    tunnel1_ike_versions                 = list(string)
    tunnel1_phase1_dh_group_numbers      = list(string)
    tunnel1_phase1_encryption_algorithms = list(string)
    tunnel1_phase1_integrity_algorithms  = list(string)

    tunnel2_preshared_key                = string
    tunnel2_ike_versions                 = list(string)
    tunnel2_phase1_dh_group_numbers      = list(string)
    tunnel2_phase1_encryption_algorithms = list(string)
    tunnel2_phase1_integrity_algorithms  = list(string)

    tags = map(string)
  }))
}