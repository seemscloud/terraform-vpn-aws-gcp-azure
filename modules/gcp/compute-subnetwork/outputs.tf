output "compute_subnetwork" {
  value = {for network in google_compute_subnetwork.compute_subnetwork : network.name => network.id}
}