output "vm_public_ip" {
  value = google_compute_instance.demo_vm.network_interface[0].access_config[0].nat_ip
}

output "gcs_bucket_name" {
  description = "Name of the GCS bucket"
  value       = google_storage_bucket.demo_bucket.name
}