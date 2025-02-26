provider "aws" {
  region = "eu-central-1"
}

variable "instance_name" {
  type    = string
  default = "live-test-instance"
}

variable "ami_id" {
  type    = string
  default = "ami-07eef52105e8a2059"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "key_name" {
  type    = string
  default = "devops-batch08"
}

variable "security_group_ids" {
  type    = list(string)
  default = [""]
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-0e2a0eea41bf2c884", "subnet-0adc427b44ad55e21", "subnet-07b0ec92b4f2aa455"]
}

variable "inbound_from_port" {
  type    = list(string)
  default = ["80", "80", "80"]
}

variable "inbound_to_port" {
  type    = list(string)
  default = ["80", "80", "80"]
}

variable "inbound_protocol" {
  type    = list(string)
  default = ["TCP", "TCP", "TCP"]
}

variable "inbound_cidr" {
  type    = list(string)
  default = ["10.2.20.0/22", "10.2.28.0/22", "10.2.24.0/22"]
}

variable "outbound_from_port" {
  type    = list(string)
  default = ["32768", "32768", "32768"]
}

variable "outbound_to_port" {
  type    = list(string)
  default = ["61000", "61000", "61000"]
}

variable "outbound_protocol" {
  type    = list(string)
  default = ["TCP", "TCP", "TCP"]
}

variable "outbound_cidr" {
  type    = list(string)
  default = ["10.2.20.0/22", "10.2.28.0/22", "10.2.24.0/22"]
}
