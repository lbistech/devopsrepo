# VPC Variables
name                        = "nodejs-prod"
environment_name            = "prod"
lbistech_vpc_cidr_block     = ["192.168.0.0/16"]
lbistech_pub_sub_cidr_block = ["192.168.1.0/24"]
availability_zone_01        = "eu-central-1a"
lbistech_pri_sub_cidr_block = ["192.168.2.0/24"]
availability_zone_02        = "eu-central-1b"
wildcard_cidr               = ["0.0.0.0/0"]
description                 = "This is our nodejs application by terraform"

# S3 Variables
bucket             = "devops-b8-terraform003"
bucket_name_08     = "devops-b8-terraform004"
Deployment         = "terraform"

# EC2 Variables
ami                = "ami-07eef52105e8a2059"
instance_type      = "t2.micro"