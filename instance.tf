resource "google_compute_instance" "instance" {
  project      = var.project
  name         = "${var.name}-instance"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = [var.name]

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public.name

    access_config {
      nat_ip = google_compute_address.instance.address
    }
  }

  service_account {
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_address" "instance" {
  project      = var.project
  name         = "${var.name}-address"
  address_type = "EXTERNAL"
  region       = var.region
}
