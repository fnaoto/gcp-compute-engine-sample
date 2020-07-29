resource "google_sql_database_instance" "database" {
  name             = "${var.name}-master"
  database_version = var.database_version
  region           = var.region

  settings {
    tier = var.database_tier
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.network.id
    }
  }
}
