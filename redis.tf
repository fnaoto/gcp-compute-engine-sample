resource "google_redis_instance" "redis" {
  name               = "${var.name}-redis"
  tier               = var.redis_tier
  memory_size_gb     = var.redis_memory_size_gb
  region             = var.region
  authorized_network = google_compute_network.network.id
  redis_version      = var.redis_version
}
