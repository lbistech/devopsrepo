# Global Variables
variable "name" {
    default = "lbistech-web"
}

variable "description" {
    default = "This is our web application terraform code"
}

variable "env" {
    default = "dev"
}

# VPC Variables
variable "lbistech_vpc_cidr_block" {
    default = "192.168.0.0/16"
}

variable "lbistech_pub_sub_cidr_block" {
    default = "192.168.1.0/24"
}

variable "availability_zone_01" {
    default = "eu-west-2a"
}

variable "availability_zone_02" {
    default = "eu-west-2b"
}

variable "availability_zone_03" {
    default = "eu-west-2c"
}

variable "wildcard_cidr" {
    default = "0.0.0.0/0"
}

variable "lbistech_pri_sub_cidr_block" {
    default = "192.168.2.0/24"
}

variable "static_pri_ip" {
    default = "192.168.1.190"
}

# EC2 Variables
variable "ec2_ami" {
    description = "This is the ec2 ami id"
    default = "ami-0015a39e4b7c0966f"
}

variable "ec2_type" {
    default = "t2.micro"
}

variable "ec2_key" {
    default = "lbistech-web-key"
}

