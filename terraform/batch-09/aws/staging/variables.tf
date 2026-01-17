### S3 Module Variables

variable "bucket_name" {
  description = "This is the name of our First AWS S3 Bucket"
  default = ""
}

variable "bucket_name_02" {
  description = "This is the name of our Second AWS S3 Bucket"
  default = ""
}

### EC2 Module Variables

variable "instance_name" {
  description = ""
  default = ""
}

variable "ami_id" {
  description = ""
  default = ""
}

variable "instance_type" {
  description = ""
  default = ""
}

variable "subnet_id" {
  description = ""
  default = ""
}

variable "key_name" {
  description = ""
  default = ""
}

### Common Variables
variable "environment_name" {
  description = "This is the environment name"
  default = ""
}

variable "account_name" {
  description = "This is the account name"
  default = ""
}

# VPC Variables
variable "name" {
  description = "This is the name of our application"
  default = ""
}

variable "lbistech_vpc_cidr_block" {
  description = "This is the vpc cidr"
  type = string
  default = ""
}

variable "lbistech_pub_sub_cidr_block" {
  description = ""
  type = string
  default = ""
}

variable "lbistech_pri_sub_cidr_block" {
  description = ""
  type = string
  default = ""
}

variable "availability_zone_01" {
  description = ""
  type = string
  default = ""
}

variable "availability_zone_02" {
  description = ""
  type = string
  default = ""
}

variable "wildcard_cidr" {
  description = ""
  type = string
  default = ""
}

variable "description" {
  description = "This is our vpc module"
  default = ""
}