resource "google_compute_network" "compute_network" {
  count = length(var.data)

  name                    = var.data[count.index].name
  auto_create_subnetworks = var.data[count.index].auto_create_subnetworks
  mtu                     = var.data[count.index].mtu
}