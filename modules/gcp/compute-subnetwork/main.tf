resource "google_compute_subnetwork" "compute_subnetwork" {
  count = length(var.data)

  name          = var.data[count.index].name
  ip_cidr_range = var.data[count.index].ip_cidr_range
  network       = var.data[count.index].network_id
}