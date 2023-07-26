resource "google_compute_firewall" "firewall_ssh_bastion" {
  name    = "allow-external-ssh-bastion"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.tags_bastion_host]
}


resource "google_compute_firewall" "firewall_ssh_web_server" {
  name    = "allow-bastion-ssh-webserver"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags = [var.tags_bastion_host]
  target_tags = [var.tags_web_server]
}

resource "google_compute_firewall" "firewall_access_web_site" {
  name    = "allow-access-website"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags      = [var.tags_web_server]
}
