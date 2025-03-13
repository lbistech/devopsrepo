variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for EKS"
  type        = string
}

variable "broker_name" {
  description = "Name of the AmazonMQ broker"
  type        = string
}

variable "rabbitmq_instance_type" {
  description = "Instance type for the AmazonMQ broker"
  type        = string
}

variable "secret_id" {
  description = "Admin username and password for the broker"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}