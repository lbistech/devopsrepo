# VPC
vpc_name             = "dev-lg4-vpc"
cidr_block           = "172.16.0.0/16"
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnet_cidrs = ["172.16.48.0/20", "172.16.64.0/20", "172.16.80.0/20"]
environment          = "dev"
enable_vpc_peering   = true
accepter_vpc_id      = "vpc-1309f576"
accepter_vpc_cidr    = "172.31.0.0/16"

# EKS
cluster_name     = "lg4-dev"
cluster_version  = "1.30"
ssh_key_name     = "lg4-dev-eks-ssh-key"
cluster_endpoint_public_access = true
cluster_endpoint_private_access = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
desired_capacity = 1
min_capacity     = 1
max_capacity     = 10
instance_type    = "m5.xlarge"
fluentbit_service_account       = "fluent-bit"
loadbalancer_service_account    = "aws-load-balancer-controller"
aws_secrets_service_account     = "aws-secrets-manager"
cluster_autoscaler_service_account = "cluster-autoscaler"
aws_ebs_csi_service_account     = "ebs-csi-controller"

# Redis
cluster_identifier   = "dev-redis-cluster"
node_type            = "cache.t4g.small"
num_cache_clusters   = 1
parameter_group_name = "default.redis7"
subnet_ids           = ["subnet-02f38c0e7b18ee785"]

# AmazonMQ
broker_name            = "dev-amazonmq-broker"
rabbitmq_instance_type = "mq.t3.micro"
secret_id              = "lg4/dev/rabbitmq"
