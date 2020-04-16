variable "service_account" {
  type        = string
  description = "Service account for qbot."
}

variable "environment" {
  type        = string
  description = "Mist environment."
}

variable "domain" {
  type        = string
  description = "Domain for qbot nodes."
}

variable "qbot_nodes" {
  type        = map
  description = "Map of qbot nodes."
}

variable "service_account_scopes" {
  type        = list(string)
  description = "Service accounts."
  default     = ["userinfo-email", "compute-ro", "storage-ro"]
}

variable "vm_disk_type" {
  type        = string
  default     = "pd-standard"
  description = "Disk type for OpenVPN VM."
}

variable "vm_type" {
  type        = string
  default     = "n1-standard-2"
  description = "Type of th GCP VM"
}

variable "zone" {
  type        = string
  description = "Zone."
}

variable "image" {
  type        = string
  description = "Image for qbot."
}

variable "subnet_name" {
  type        = string
  description = "Subnet name."
}

variable "os_volume_size" {
  type        = string
  description = "Disk size for os volume."
}

variable "data_volume_size" {
  type        = string
  description = "Disk size for qbot data volume."
}

variable "project" {
  type        = string
  description = "Project."
}

variable "host_project" {
  type        = string
  description = "Host project."
}

variable "shared_network" {
  type        = string
  description = "Mist shared network."
}

variable "region" {
  type        = string
  description = "Region."
}

variable "private_dns_zone_name" {
  type        = string
  description = "Private DNS zone name."
}


