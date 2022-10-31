resource "google_compute_firewall" "iti-firewall-ssh" {
  name    = "${var.env}-iti-firewall-ssh"
  network = google_compute_network.iti-network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
}

resource "google_compute_firewall" "iti-firewall-http" {
  name    = "${var.env}-iti-firewall-http"
  network = google_compute_network.iti-network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
}