output "compute_network" {
  value = {for network in google_compute_network.compute_network : network.name => network.id}
}