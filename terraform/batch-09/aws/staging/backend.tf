terraform {
  backend "s3" {
    bucket = "lbistech-b9-terraform-state-bucket"
    key = "staging-env"
    region = "us-east-1"
    dynamodb_table = "lbistec-b9-terraform-lock"
    encrypt = true
  }
}