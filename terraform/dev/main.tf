module "vpc" {
  source      = "../modules/vpc"
  cidr_block  = var.cidr_block
  azs         = var.azs
  vpc_name    = var.vpc_name
  cluster_name = var.cluster_name
  environment = var.environment
  enable_vpc_peering   = var.enable_vpc_peering
  accepter_vpc_id      = var.accepter_vpc_id
  accepter_vpc_cidr    = var.accepter_vpc_cidr
}

module "eks" {
  source                          = "../modules/eks"
  cluster_name                    = var.cluster_name
  cluster_version                 = var.cluster_version
  vpc_id                          = module.vpc.vpc_id
  private_subnet_ids              = module.vpc.private_subnet_ids
  private_subnet_cidrs            = var.private_subnet_cidrs
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  desired_capacity                = var.desired_capacity
  min_capacity                    = var.min_capacity
  max_capacity                    = var.max_capacity
  instance_type                   = var.instance_type
  ssh_key_name                    = var.ssh_key_name
  environment                     = var.environment
  fluentbit_service_account       = var.fluentbit_service_account
  loadbalancer_service_account    = var.loadbalancer_service_account
  aws_secrets_service_account     = var.aws_secrets_service_account
  cluster_autoscaler_service_account = var.cluster_autoscaler_service_account
  aws_ebs_csi_service_account     = var.aws_ebs_csi_service_account
}