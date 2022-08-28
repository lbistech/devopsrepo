provider "aws" {
    region = "eu-west-2"
}

terraform {
    backend "s3" {
        bucket = "lbistech-web-dev-tfstate"
        key    = "dev-env"
        region = "eu-west-2"
    }
}

resource "aws_instance" "WebServer" {
    ami = "ami-0015a39e4b7c0966f"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.Web-Pub-SN.id

    tags = {
      "Name" = "WebServer01"
      "UserType" = "Machine"
      "BillingGroup" = "dev"
    }
}

resource "aws_vpc" "WebVPC" {
    cidr_block = "192.168.0.0/16"

    tags = {
        "Name" = "LbisTech-Terraform-VPC"
        "Environment" = "Dev"
        "UserType" = "Machine"
    }
}

resource "aws_subnet" "Web-Pub-SN" {
    vpc_id = aws_vpc.WebVPC.id
    cidr_block = "192.168.1.0/24"

    tags = {
        "Name" = "LbisTech-Terraform-Pub-SN"
        "Environment" = "Dev"
        "UserType" = "Machine"
    }
}

resource "aws_s3_bucket" "LbisTech-Bucket" {
    bucket = "lbistech-web-bucket-99922"
    acl = "private"

    tags = {
        "Name" = "lbistech-web-bucket-99922"
        "Environment" = "Dev"
        "UserType" = "Machine"
    }
}