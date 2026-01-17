terraform {
  backend "gcs" {
    bucket = "devops-b9-terraform-state"
    prefix = "terraform/state/dev-gcp-cloud"
  }
}