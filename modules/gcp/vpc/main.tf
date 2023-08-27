resource "google_compute_network" "compute_network" {
  count = length(var.inputs)

  project                 = var.project_name
  name                    = var.inputs[count.index].name
  auto_create_subnetworks = var.inputs[count.index].auto_create_subnetworks
  mtu                     = var.inputs[count.index].mtu
}