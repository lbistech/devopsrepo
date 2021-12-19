resource "aws_s3_bucket" "LbisTech-Bucket" {
    bucket = "lbistech-web-bucket-99922"
    acl = "private"

    tags = {
        "Name" = "lbistech-web-bucket-99922"
        "Environment" = "Dev"
        "UserType" = "Machine"
    }
}