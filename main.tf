// Compute Instance
resource "google_compute_instance" "default" {
  name         = "test-instance-1"
  machine_type = "e2-medium"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }


  labels = {
    billing     = "102012",
    dept        = "IT",
    environment = "sandbox"
  }

}

// VPC
resource "google_compute_network" "default" {
  name = "vpc-network"

}

// Firewall Rule
resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["21"]
  }

  source_tags = ["web"]
}
