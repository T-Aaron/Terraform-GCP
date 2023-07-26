output "vpc_network" {
  description = "VPC Network self link"
  value       = google_compute_network.vpc_network.self_link
}
