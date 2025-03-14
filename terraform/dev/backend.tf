terraform {
  backend "s3" {
    bucket         = "devops-b8-terraform-statefile"      
    key            = "terraform/dev/eks.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-lock-dev"
    encrypt        = true
  }
}