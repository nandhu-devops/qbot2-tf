resource "google_compute_firewall" "openvpn_qbot_access" {
  name    = "${var.service_account}-openvpn-qbot-access"
  network = var.shared_network
  project = var.host_project

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_service_accounts = [data.google_service_account.mist_openvpn.email]

  target_service_accounts = [google_service_account.mist_qbot.email]
}

