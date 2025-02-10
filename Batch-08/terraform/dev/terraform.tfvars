# VPC Variables
name                        = "nodejs"
environment_name            = "dev"
lbistech_vpc_cidr_block     = "10.0.0.0/16"
lbistech_pub_sub_cidr_block = "10.0.1.0/24"
availability_zone_01        = "us-east-1a"
lbistech_pri_sub_cidr_block = "10.0.2.0/24"
availability_zone_02        = "us-east-1b"
wildcard_cidr               = "0.0.0.0/0"
description                 = "This is our nodejs application by terraform"

# S3 Variables
bucket_name        = "devops-b8-terraform001"
bucket_name_08     = "devops-b8-terraform002"
deployment_method  = "terraform"

# EC2 Variables
ami_id             = "ami-04b4f1a9cf54c11d0"
instance_type      = "t2.micro"