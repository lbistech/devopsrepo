output "vpc_id" {
    value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

# output "name" {
#   value = aws_instance.devops-b9-instance.associate_public_ip_address
# }

# output "aws_s3_bucket" {
#   value = aws_s3_bucket.devops-b9-bucket_01.bucket
# }