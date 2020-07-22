resource "google_compute_firewall" "from_all" {
  project = var.project
  name    = "${var.name}-firewall"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["from_all"]
}
