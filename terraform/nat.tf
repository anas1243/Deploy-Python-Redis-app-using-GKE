resource "google_compute_router" "iti-router-vm-subnet" {
  name    = "${var.env}-iti-router-vm-subnet"
  region  = var.private-subnet1-region
  network = google_compute_network.iti-network.id
}

resource "google_compute_router_nat" "iti-nat-vm-subnet" {
  name                               = "${var.env}-iti-nat-vm-subnet"
  router                             = google_compute_router.iti-router-vm-subnet.name
  region                             = var.private-subnet1-region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_router" "iti-router-cluster-subnet" {
  name    = "${var.env}-iti-router-cluster-subnet"
  region  = var.private-subnet2-region
  network = google_compute_network.iti-network.id
}

resource "google_compute_router_nat" "iti-nat-cluster-subnet" {
  name                               = "${var.env}-iti-nat-cluster-subnet"
  router                             = google_compute_router.iti-router-cluster-subnet.name
  region                             = var.private-subnet2-region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}