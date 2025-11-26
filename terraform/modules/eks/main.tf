provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = var.cluster_name
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

  # Managed Node Groups
  eks_managed_node_groups = {
    eks_nodes = {
      ami_type         = "AL2_x86_64"
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
