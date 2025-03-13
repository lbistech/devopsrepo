# VPC and EKS Cluster Infrastructure using Terraform

This repository provisions a **VPC** and an **EKS Cluster** on AWS using **Terraform**. It includes a modular design for reusable infrastructure components, enabling efficient management of cloud resources.

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)

---

## Overview

This project automates the creation of the following AWS resources:
- **VPC**:
  - Custom CIDR block.
  - Public and private subnets across multiple availability zones.
  - Internet Gateway and NAT Gateway for secure communication.
- **EKS Cluster**:
  - Kubernetes cluster managed by AWS EKS.
  - Managed Node Groups with customizable instance types, scaling options, and SSH access.

---

## Architecture

The infrastructure includes:
1. **VPC**:
   - A custom VPC with isolated subnets for better security and scalability.
   - Public subnets for load balancers and private subnets for worker nodes.
   - NAT Gateway for outbound internet access from private subnets.

2. **EKS Cluster**:
   - A fully managed Kubernetes cluster with support for worker nodes.
   - Security groups for restricted access between nodes and the control plane.

---

## Prerequisites

Ensure the following tools are installed and configured on your local machine:
1. [**Terraform**](https://www.terraform.io/downloads.html) (>= v1.0)
2. [**AWS CLI**](https://aws.amazon.com/cli/) (Configured with appropriate credentials)
3. [**kubectl**](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
4. IAM user/role with permissions to manage:
   - VPC
   - EC2
   - EKS
   - IAM

---


