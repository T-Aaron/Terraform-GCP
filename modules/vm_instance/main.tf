// ------------------- Bastion host -------------------
resource "google_compute_address" "Ex_IPv4_static_bastion" {
  name   = "ex-ipv4-static-bastion"
  region = "asia-southeast1"
}

resource "google_compute_instance" "bastion-host" {
  name = var.name_bastion

  machine_type = var.machine_type_bastion_host
  zone         = var.zone

  tags = [var.tags_bastion_host]


  boot_disk {
    initialize_params {
      image = var.image_bastion_host
      size  = 20
    }
  }

  network_interface {
    network    = var.name_vpc_network
    subnetwork = var.name_subnet_bastion
    network_ip = var.IPv4_bastion
    access_config {
      nat_ip = google_compute_address.Ex_IPv4_static_bastion.address
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "sudo dnf update -y"

  service_account {
    # See scope here: https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes
    scopes = ["compute-rw"]
  }

}

resource "google_compute_disk" "ssd-web-server" {
  name = "data-disk-web-server"
  size = 40
  type = "pd-ssd"
  zone = var.zone
}

resource "google_compute_instance" "web-server" {
  name         = var.name_web_server
  machine_type = var.machine_type_web_server
  zone         = var.zone

  tags = [var.tags_web_server, "http-server", "https-server"]


  boot_disk {
    initialize_params {
      image = var.image_web_server
      size  = 20
    }
  }

  network_interface {
    network    = var.name_vpc_network
    subnetwork = var.name_subnet_web_server
    network_ip = var.IPv4_web_server
  }

  attached_disk {
    source      = google_compute_disk.ssd-web-server.id
    device_name = google_compute_disk.ssd-web-server.name
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = file(var.bash_script_web_server)

}
