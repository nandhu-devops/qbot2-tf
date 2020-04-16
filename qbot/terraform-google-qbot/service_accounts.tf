resource "google_service_account" "mist_jenkins" {
  account_id   = var.service_account
  display_name = var.service_account
  project      = var.project
}

data "google_service_account" "mist_openvpn" {
  account_id = var.openvpn_service_account
  project    = var.project
}

