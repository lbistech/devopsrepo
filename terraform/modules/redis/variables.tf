variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for EKS"
  type        = string
}

variable "cluster_identifier" {
  description = "The ID of the Redis cluster"
  type        = string
}

variable "node_type" {
  description = "Instance type for the Redis cluster"
  type        = string
}

variable "num_cache_clusters" {
  description = "Number of cache nodes"
  type        = number
}

variable "parameter_group_name" {
  description = "Parameter group for Redis"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}
