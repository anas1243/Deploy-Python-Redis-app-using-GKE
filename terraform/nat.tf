resource "google_compute_router" "iti-router" {
  name    = "${var.env}-iti-router"
  region  = var.private-subnet1-region
  network = google_compute_network.iti-network.id
}

resource "google_compute_router_nat" "iti-nat" {
  name                               = "${var.env}-iti-nat"
  router                             = google_compute_router.iti-router.name
  region                             = var.private-subnet1-region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}