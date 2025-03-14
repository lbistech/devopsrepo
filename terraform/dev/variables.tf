# VPC Varibales
variable "cidr_block" {
  default = ""
}

variable "azs" {
  default = ""
}

variable "vpc_name" {
  default = ""
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "environment" {
  description = "Environment name for tagging"
  default     = ""
}

# EKS Variables
variable "cluster_name" {
  default     = ""
}

variable "cluster_version" {
  default     = ""
}

variable "aws_secrets_service_account" {
  description = "The aws secrets manager service account name"
  type        = string
}

variable "fluentbit_service_account" {
  description = "The fluent bit service account name"
  type        = string
}

variable "loadbalancer_service_account" {
  description = "The aws loadbalancer service account name"
  type        = string
}

variable "cluster_autoscaler_service_account" {
  description = "The cluster autoscaler service account name"
  type        = string
}

variable "aws_ebs_csi_service_account" {
  description = "The aws ebs csi driver service account name"
  type        = string
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  type        = bool
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  type        = bool
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint"
  type        = list(string)
}

variable "desired_capacity" {
  default     = ""
}

variable "min_capacity" {
  default     = ""
}

variable "max_capacity" {
  default     = ""
}

variable "instance_type" {
  default     = ""
}

variable "ssh_key_name" {
  description = "SSH key name for accessing worker nodes"
  type        = string
  default     = "dev-ssh-key"
}

# Variable for enabling/disabling VPC peering
variable "enable_vpc_peering" {
  description = "Enable or disable VPC peering"
  type        = bool
  default     = false
}

# Variable for Accepter VPC ID
variable "accepter_vpc_id" {
  description = "The ID of the Accepter VPC for the peering connection"
  type        = string
  default     = null
}

variable "accepter_vpc_cidr" {
  description = "The CIDR block of the Accepter VPC for the VPC peering"
  type        = string
}