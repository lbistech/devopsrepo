resource "aws_s3_bucket" "devopsb9" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment_name
    Deployment  = var.deployment_method
  }
}

resource "aws_s3_bucket" "devopsb8" {
  bucket = var.bucket_name_08

  tags = {
    Name        = var.bucket_name_08
    Environment = var.environment_name
    Deployment  = var.deployment_method
  }
}