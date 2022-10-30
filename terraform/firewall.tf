resource "google_compute_firewall" "iti-firewall" {
  name    = "${var.env}-iti-firewall"
  network = google_compute_network.iti-network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
}