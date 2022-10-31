resource "google_container_registry" "iti-gcr" {
  project  = "${var.project-id}"
  location = "EU"
}