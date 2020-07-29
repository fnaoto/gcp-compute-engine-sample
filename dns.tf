resource "google_dns_managed_zone" "private" {
  name       = "${var.name}-private"
  dns_name   = "private.internal."
  visibility = "private"

  private_visibility_config {
    networks {
      network_url = google_compute_network.network.id
    }
  }
}

resource "google_dns_record_set" "database" {
  name         = "database.${google_dns_managed_zone.private.dns_name}"
  managed_zone = google_dns_managed_zone.private.name
  type         = "A"
  ttl          = 300

  rrdatas = [google_sql_database_instance.database.public_ip_address]
}

resource "google_dns_record_set" "redis" {
  name         = "redis.${google_dns_managed_zone.private.dns_name}"
  managed_zone = google_dns_managed_zone.private.name
  type         = "A"
  ttl          = 300

  rrdatas = [google_redis_instance.redis.host]
}
