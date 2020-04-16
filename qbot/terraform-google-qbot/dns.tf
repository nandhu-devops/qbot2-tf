data "google_dns_managed_zone" "private_dns_zone" {
  project = var.host_project
  name    = var.private_dns_zone_name
}

resource "google_dns_record_set" "qbot_a" {
  for_each = var.jenkins_nodes

  project = var.host_project
  name    = "${each.value}.${data.google_dns_managed_zone.private_dns_zone.dns_name}"
  type    = "A"
  ttl     = 300

  managed_zone = data.google_dns_managed_zone.private_dns_zone.name

  rrdatas = [google_compute_instance.qbot[each.key].network_interface.0.network_ip]
}

