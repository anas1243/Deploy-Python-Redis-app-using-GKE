resource "google_project_iam_binding" "cluster-svc-account-binding" {
  project = var.project-id
  role    = "roles/container.admin"

  members = [
    "serviceAccount:${google_service_account.cluster-svc-account.email}",
  ]
}


resource "google_project_iam_binding" "bastion-svc-account-binding" {
  project = var.project-id
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.bastion-svc-account.email}",
  ]
}