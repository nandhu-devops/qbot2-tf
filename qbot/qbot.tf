module "qbot" {
  source = "../../../modules/terraform-google-qbot"

  zone                      = "us-west2-a"
  service_account           = "mist-qbot-production"
  project                   = "mist-platform-prod"
  host_project              = "mist-host-prod"
  region                    = "us-west2"
  private_dns_zone_name     = "mist-pvt-production-private"
  shared_network            = "mist-shared-network"
  subnet_name               = "mist-public-subnet1"
  domain                    = "mist.pvt"
  os_volume_size            = "50"
  data_volume_size          = "500"
  environment               = "production"
  image                     = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20191021"
  network_tags              = ["qbot"]
  qbot_nodes = {
    1 = "qbot-production",
  }
}
