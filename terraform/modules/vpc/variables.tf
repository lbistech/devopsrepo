variable "cluster_name" {
  description = "Name of the EKS cluster to tag subnets for Kubernetes integration"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "environment" {
  description = "Environment name for tagging resources"
  type        = string
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