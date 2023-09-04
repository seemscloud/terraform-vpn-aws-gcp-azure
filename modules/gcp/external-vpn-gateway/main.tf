resource "google_compute_external_vpn_gateway" "external_vpn_gateway" {
  count = length(var.data)

  name            = var.data[count.index].name
  redundancy_type = var.data[count.index].redundancy_type

  dynamic "interface" {
    for_each = var.data[count.index].interfaces
    iterator = ifc
    content {
      id         = ifc.key
      ip_address = ifc.value
    }
  }
}