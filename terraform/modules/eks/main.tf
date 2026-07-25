provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

data "aws_caller_identity" "current" {}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.private_subnet_ids

  # Enable public endpoint access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs

  # Enable OIDC Provider for IRSA
  enable_irsa = true

  # Grant the identity running Terraform admin access to the cluster
  enable_cluster_creator_admin_permissions = true

  # Managed Node Groups
  eks_managed_node_groups = {
    eks_nodes = {
      ami_type         = "AL2023_x86_64_STANDARD"
      desired_size     = var.desired_capacity
      max_size         = var.max_capacity
      min_size         = var.min_capacity
      instance_types   = [var.instance_type]
      key_name         = var.ssh_key_name

      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size = 100
            volume_type = "gp3"
            delete_on_termination = true
          }
        }
      }
    }
  }

  tags = {
    Name = var.cluster_name
    Environment = var.environment
  }
}

resource "aws_security_group" "eks_cluster" {
  
  name_prefix = "${var.cluster_name}-eks-sg"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow traffic from worker nodes"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_name}-eks-sg"
    Environment = var.environment
  }
}
