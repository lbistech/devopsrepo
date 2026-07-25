# VPC
vpc_name             = "aiops-eks-vpc"
cidr_block           = "172.16.0.0/16"
azs                  = ["eu-central-1a", "eu-central-1b"]
private_subnet_cidrs = ["172.16.48.0/20", "172.16.64.0/20"]
environment          = "dev"
enable_vpc_peering   = false

# EKS
cluster_name     = "aiops-eks"
cluster_version  = "1.34"
ssh_key_name     = "lbistech-website-v1"
cluster_endpoint_public_access = true
cluster_endpoint_private_access = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
desired_capacity = 1
min_capacity     = 1
max_capacity     = 4
instance_type    = "t3.medium"
fluentbit_service_account       = "fluent-bit"
loadbalancer_service_account    = "aws-load-balancer-controller"
aws_secrets_service_account     = "aws-secrets-manager"
cluster_autoscaler_service_account = "cluster-autoscaler"
aws_ebs_csi_service_account     = "ebs-csi-controller"