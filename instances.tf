variable "instances" {
  type    = number
  description = "The Number of VMs to create variable"
  default = 2
}

resource "google_compute_instance" "default" {
  count        = var.instances
  name         = "terraform-${count.index}"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  tags         = ["web-server", "Admins"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link
  }
}
