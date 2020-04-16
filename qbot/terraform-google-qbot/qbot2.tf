resource "google_compute_disk" "qbot_disk" {
  for_each = var.qbot_nodes

  project = var.project
  name    = "${each.value}-os"
  type    = var.vm_disk_type
  zone    = var.zone
  image   = var.image
  size    = var.os_volume_size
  labels = {
    environment = var.environment
  }
  physical_block_size_bytes = 4096
}


resource "google_compute_disk" "qbot_disk_data" {
  for_each = var.qbot_nodes

  project = var.project
  name    = "${each.value}-data"
  type    = var.vm_disk_type
  zone    = var.zone
  size    = var.data_volume_size
  labels = {
    environment = var.environment
  }
  physical_block_size_bytes = 4096
}

resource "google_compute_instance" "qbot" {
  for_each = var.qbot_nodes

  project      = var.project
  name         = each.value
  machine_type = var.vm_type
  zone         = var.zone

  boot_disk {
    source = google_compute_disk.qbot_disk[each.key].self_link
  }

  attached_disk {
    source = google_compute_disk.qbot_disk_data[each.key].self_link
  }

  network_interface {
    network    = data.google_compute_network.mist_shared_network.self_link
    subnetwork = data.google_compute_subnetwork.subnet.self_link

  }

  metadata = {
    role = var.service_account
  }

  allow_stopping_for_update = true

  service_account {
    email  = google_service_account.mist_qbot.email
    scopes = var.service_account_scopes
  }

}
