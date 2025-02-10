module "vpc" {
  source                      = "../modules/vpc"
  name                        = var.name
  environment_name            = var.environment_name
  lbistech_vpc_cidr_block     = var.lbistech_vpc_cidr_block
  lbistech_pub_sub_cidr_block = var.lbistech_pub_sub_cidr_block
  availability_zone_01        = var.availability_zone_01
  lbistech_pri_sub_cidr_block = var.lbistech_pri_sub_cidr_block
  availability_zone_02        = var.availability_zone_02
  wildcard_cidr               = var.wildcard_cidr
  description                 = var.description
}

module "s3" {
  bucket             = var.bucket_name
  bucket_name_08     = var.bucket_name_08
  environment_name   = var.environment_name
  Deployment         = var.deployment_method
}

module "ec2" {
  name          = var.name
  ami           = var.ami_id
  instance_type = var.instance_type
}