terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 5.0"
    }
  }
}

provider "google" {
    project = var.project_id
    region  = var.region
    zone    = var.zone
}

resource "google_compute_instance" "demo_vm" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = var.image
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

resource "google_storage_bucket" "demo_bucket" {
  name          = var.bucket_name
  location      = var.bucket_location
  storage_class = var.storage_class

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  labels = {
    environment = "training"
    managed_by  = "terraform"
  }
}