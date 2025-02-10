variable "name" {
  description = "This is the name of our application"
  default = ""
}

variable "environment_name" {
  description = "The name of the environment in which we are creating the resources"
  default = ""
}

variable "lbistech_vpc_cidr_block" {
  description = "This is the vpc cidr"
  type = list()
  default = []
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
  type = list()
  default = []
}

variable "description" {
  description = "This is our vpc module"
  default = ""
}

# S3 buckets variables
variable "bucket_name" {
  description = "This is the name of our AWS S3 bucket"
  default = ""
}

variable "bucket_name_08" {
  description = "This is the name of our AWS S3 bucket of batch08"
  default = ""
}

variable "deployment_method" {
  description = "This is the name of our AWS S3 bucket"
  default = ""
}

# EC2 instance variables
variable "ami_id" {
  description = ""
  default = ""
}