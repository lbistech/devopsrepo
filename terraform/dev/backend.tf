terraform {
  backend "s3" {
    bucket         = "devops-b8-terraform-statefile"      
    key            = "terraform/dev/ekslatest.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}