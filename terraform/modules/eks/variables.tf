variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for EKS"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnets for EKS worker nodes"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
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
  description = "Desired number of worker nodes"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "instance_type" {
  description = "Instance type for worker nodes"
  type        = string
}

variable "ssh_key_name" {
  description = "SSH key name for accessing worker nodes"
  type        = string
}

variable "environment" {
  description = "Environment name for tagging resources"
  type        = string
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