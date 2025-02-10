# VPC Variables
name                        = "nodejs-staging"
environment_name            = "staging"
lbistech_vpc_cidr_block     = "192.168.0.0/16"
lbistech_pub_sub_cidr_block = "192.168.1.0/24"
availability_zone_01        = "us-east-1a"
lbistech_pri_sub_cidr_block = "192.168.2.0/24"
availability_zone_02        = "us-east-1b"
wildcard_cidr               = "0.0.0.0/0"
description                 = "This is our nodejs application by terraform"

# S3 Variables
bucket_name        = "devops-b8-terraform003"
bucket_name_08     = "devops-b8-terraform004"
deployment_method  = "terraform"

# EC2 Variables
ami_id             = "ami-04b4f1a9cf54c11d0"
instance_type      = "t2.micro"