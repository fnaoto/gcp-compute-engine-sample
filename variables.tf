provider "google" {
  project = var.project
  region  = "asia-northeast1"
}

terraform {
  backend "gcs" {}
}

variable "project" {}

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
  default = "centos-7-v20200714"
}
