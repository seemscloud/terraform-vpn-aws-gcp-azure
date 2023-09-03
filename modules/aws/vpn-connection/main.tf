resource "aws_vpn_connection" "vpn_connection" {
  count               = length(var.data)
  vpn_gateway_id      = var.data[count.index].vpn_gateway_id
  customer_gateway_id = var.data[count.index].customer_gateway_id
  type                = var.data[count.index].type
  static_routes_only  = var.data[count.index].static_routes_only

  tunnel1_preshared_key                = var.data[count.index].tunnel1_preshared_key
  tunnel1_ike_versions                 = var.data[count.index].tunnel1_ike_versions
  tunnel1_phase1_dh_group_numbers      = var.data[count.index].tunnel1_phase1_dh_group_numbers
  tunnel1_phase1_encryption_algorithms = var.data[count.index].tunnel1_phase1_encryption_algorithms
  tunnel1_phase1_integrity_algorithms  = var.data[count.index].tunnel1_phase1_integrity_algorithms

  tunnel2_preshared_key                = var.data[count.index].tunnel2_preshared_key
  tunnel2_ike_versions                 = var.data[count.index].tunnel2_ike_versions
  tunnel2_phase1_dh_group_numbers      = var.data[count.index].tunnel2_phase1_dh_group_numbers
  tunnel2_phase1_encryption_algorithms = var.data[count.index].tunnel2_phase1_encryption_algorithms
  tunnel2_phase1_integrity_algorithms  = var.data[count.index].tunnel2_phase1_integrity_algorithms

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)
}