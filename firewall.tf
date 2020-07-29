resource "google_compute_firewall" "from_all" {
  name    = "${var.name}-firewall-from-all"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.name]
}

resource "google_compute_firewall" "from_internal" {
  name    = "${var.name}-firewall-from-internal"
  network = google_compute_network.network.name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [google_compute_subnetwork.public.ip_cidr_range]
  target_tags   = [var.name]
}
