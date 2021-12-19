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

# Create VPC
## Public Subnet & Private subnets
## Internet Gateway
## Route Table - Public RT & Private RT
## Security Group
## Network Interface NIC
## EIP
## EC2 instance apache2 install and verify web page