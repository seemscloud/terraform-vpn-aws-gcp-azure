output "ha_vpn_gateway" {
  value = {
    for ha_vpn_gateway in google_compute_ha_vpn_gateway.ha_vpn_gateway : ha_vpn_gateway.name =>
    ha_vpn_gateway.vpn_interfaces[*]
  }
}