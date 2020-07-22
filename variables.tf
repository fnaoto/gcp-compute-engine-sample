provider "google" {
  project = "sample"
  region  = "asia-northeast1"
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

variable "project" {
  default = "project"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "public_subnet_ip_cidr_range" {
  default = "192.168.1.0/24"
}

variable "boot_disk_image" {
  default = "debian-cloud/debian-10"
}