provider "google" {
  project = "mfa-project-374417"
  region  = "us-central1"
}
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

