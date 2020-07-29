resource "google_sql_database_instance" "database" {
  name             = "${var.name}-db-instance"
  database_version = var.database_version
  region           = var.region

  settings {
    tier              = var.database_tier
    availability_type = var.availability_type

    backup_configuration {
      enabled = true
    }

    ip_configuration {
      authorized_networks {
        name  = "${var.name}-instance-address"
        value = google_compute_address.instance.address
      }
    }
  }
}

resource "google_sql_database" "database" {
  name     = "${var.name}-db"
  instance = google_sql_database_instance.database.name
}

resource "google_sql_user" "database" {
  name     = var.postgres_name
  instance = google_sql_database_instance.database.name
  password = var.postgres_password
}
