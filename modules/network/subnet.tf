// Create subnet for bastion host
resource "google_compute_subnetwork" "private-bastion-subnet" {
  name          = var.name_subnet_bastion
  ip_cidr_range = var.IPv4_range_bastion
  region        = var.region
  network       = google_compute_network.vpc_network.name
}

// Create subnet for web server
resource "google_compute_subnetwork" "private-web-server-subnet" {
  name          = var.name_subnet_web_server
  ip_cidr_range = var.IPv4_range_web_server
  region        = var.region
  network       = google_compute_network.vpc_network.name
}

// Create subnet for private service connection MySQL Service by GCP
