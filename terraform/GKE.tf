resource "google_container_cluster" "iti-gke" {
  name       = "${var.env}-iti-gke"
  location   = var.private-subnet2-region

  networking_mode = "VPC_NATIVE"
  network    = google_compute_network.iti-network.name
  subnetwork = google_compute_subnetwork.GKE-private-subnet.name

  remove_default_node_pool = true
  initial_node_count       = 1
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
    master_global_access_config {
      enabled = true
    }

  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "${google_compute_instance.bastion-vm.network_interface.0.network_ip}/32"
    }
  }
  ip_allocation_policy {}

}

resource "google_container_node_pool" "iti-node-pool" {
  name       = "${var.env}-iti-node-pool"
  location   = var.private-subnet2-region
  cluster    = google_container_cluster.iti-gke.name
  node_count = 1
  node_config {
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.bastion-svc-account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}