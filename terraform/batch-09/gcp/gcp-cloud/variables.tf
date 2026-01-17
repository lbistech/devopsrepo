variable "project_id" {
  description = "GCP Project ID"
  type = string
}

variable "region" {
  description = "GCP region"
  type = string
  default = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type = string
  default = "us-central1-a"
}

variable "name" {
  description = "GCP VM name"
  type = string
}

variable "machine_type" {
  description = "GCP VM machine type"
  type = string
}

variable "image" {
  description = "GCP VM machine image"
  type = string
  default = ""
}

variable "bucket_name" {
  description = "GCP bucket name"
  type = string
  default = ""
}

variable "bucket_location" {
  description = "GCP bucket location"
  type = string
  default = ""
}

variable "storage_class" {
  description = "GCP bucket storage class"
  type = string
  default = ""
}