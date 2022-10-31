resource "google_compute_network" "iti-network" {
  name                    = "${var.env}-iti-vpc"
  auto_create_subnetworks = false
}