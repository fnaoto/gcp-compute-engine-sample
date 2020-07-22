resource "google_compute_network" "network" {
  name                    = "${var.name}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {
  name          = "${var.name}-public-subnet"
  ip_cidr_range = var.public_subnet_ip_cidr_range
  region        = var.region
  network       = google_compute_network.network.name
}
