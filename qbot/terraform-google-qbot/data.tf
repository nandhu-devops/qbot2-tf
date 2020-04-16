data "google_compute_network" "mist_shared_network" {
  name    = var.shared_network
  project = var.host_project
}

data "google_compute_subnetwork" "subnet" {
  name    = var.subnet_name
  region  = var.region
  project = var.host_project
}
