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

resource "google_compute_firewall" "from_internal" {
  name    = "${var.name}-firewall-from_internal"
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

  source_ranges = [var.public_subnet_ip_cidr_range]
  target_tags   = [google_compute_instance.instance.tags]
}
