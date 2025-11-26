# VPC
vpc_name             = "dev-vpc"
cidr_block           = "172.16.0.0/16"
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnet_cidrs = ["172.16.48.0/20", "172.16.64.0/20", "172.16.80.0/20"]
environment          = "dev"
enable_vpc_peering   = false
accepter_vpc_id      = "vpc-12345678"
accepter_vpc_cidr    = "172.31.0.0/16"

# EKS
cluster_name     = "dev"
cluster_version  = "1.32"
ssh_key_name     = "lb-eks-cluster"
cluster_endpoint_public_access = true
cluster_endpoint_private_access = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
desired_capacity = 1
min_capacity     = 1
max_capacity     = 4
instance_type    = "m3.medium"
fluentbit_service_account       = "fluent-bit"
loadbalancer_service_account    = "aws-load-balancer-controller"
aws_secrets_service_account     = "aws-secrets-manager"
cluster_autoscaler_service_account = "cluster-autoscaler"
aws_ebs_csi_service_account     = "ebs-csi-controller"