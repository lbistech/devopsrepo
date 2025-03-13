terraform {
  backend "s3" {
    bucket         = "launchgood-terraform-state-bucket"      
    key            = "terraform/dev/eks.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-dev"
    encrypt        = true
  }
}