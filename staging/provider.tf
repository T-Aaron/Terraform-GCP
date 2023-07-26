terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

// Provider of GCP is google
provider "google" {
  credentials = file("victus.json")
  project = var.project
  region  = var.region
  zone    = var.zone
}
