resource "google_service_account" "cluster-svc-account" {
  project    = "${var.project-id}"
  account_id = "${var.env}-cluster-svc-account"
}


resource "google_service_account" "bastion-svc-account" {
  project    = "${var.project-id}"
  account_id = "${var.env}-bastion-svc-account"
}