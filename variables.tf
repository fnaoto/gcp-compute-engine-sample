provider "google" {
  region = "asia-northeast1"
}

terraform {
  backend "gcs" {}
}

variable "name" {
  default = "name"
}

variable "region" {
  default = "asia-northeast1"
}

variable "zone" {
  default = "asia-northeast1-a"
}

variable "machine_type" {
  default = "g1-small"
}

variable "public_subnet_ip_cidr_range" {
  default = "192.168.1.0/24"
}

variable "boot_disk_image" {
  default = "centos-cloud/centos-7"
}

variable "metadata_startup_script" {
  default = <<EOF
      yum install -y nginx;
      service nginx start;
EOF
}

variable "database_version" {
  default = "POSTGRES_12"
}

variable "database_tier" {
  default = "db-f1-micro"
}

locals {
  tags = [
    "http-server",
    "https-server",
    "name",
  ]
}
