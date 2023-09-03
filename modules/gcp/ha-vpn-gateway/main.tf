resource "google_compute_ha_vpn_gateway" "ha_vpn_gateway" {
  count      = length(var.data)
  name       = var.data[count.index].name
  stack_type = var.data[count.index].stack_type
  network    = var.data[count.index].network_id
}