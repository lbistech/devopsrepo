variable "name" {
  description = "This is the name of our application"
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

variable "environment_name" {
  description = "The name of the environment in which we are creating the resources"
  default = ""
}

variable "deployment_method" {
  description = "This is the name of our AWS S3 bucket"
  default = ""
}