resource "aws_s3_bucket" "devops-b9-bucket_01" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment_name
    Account     = var.account_name
  }
}

resource "aws_s3_bucket" "devops-b9-bucket_02" {
  bucket = var.bucket_name_02

  tags = {
    Name        = var.bucket_name_02
    Environment = var.environment_name
    Account     = var.account_name
  }
}