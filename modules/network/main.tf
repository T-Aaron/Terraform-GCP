// Create VPC network
resource "google_compute_network" "vpc_network" {
  name = var.name_vpc_network
}