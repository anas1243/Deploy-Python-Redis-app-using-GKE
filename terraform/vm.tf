resource "google_compute_instance" "bastion-vm" {
  name         = "${var.env}-bastion-vm"
  machine_type = "${var.vm-type}"
  zone         = "${var.private-subnet1-region}-b"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vm-private-subnet.name
    # A Private IP will be assigned automatically 
    # No public IP will be assigned by default if we don't mention
  }



}