resource "google_compute_firewall" "from_all" {
  name    = "${var.name}-firewall"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [google_compute_instance.instance.tags]
}
