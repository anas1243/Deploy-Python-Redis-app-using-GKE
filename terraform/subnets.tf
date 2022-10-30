resource "google_compute_subnetwork" "vm-private-subnet" {
  name          = "${var.env}-vm-private-subnet"
  ip_cidr_range = "${var.private-subnet1-CIDR}"
  region        = "${var.private-subnet1-region}"
  network       = google_compute_network.iti-network.id

}


resource "google_compute_subnetwork" "GKE-private-subnet" {
  name          = "${var.env}-gke-private-subnet"
  ip_cidr_range = "${var.private-subnet2-CIDR}"
  region        = "${var.private-subnet2-region}"
  network       = google_compute_network.iti-network.id

}