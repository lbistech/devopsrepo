#!/bin/bash

###############################################
# EKS Add-ons Automated Installer (with checks)
# Author: Usman Ahmad
# Date: 22 Nov 2025
###############################################

set -e

#############################
# Input Parameters
#############################
CLUSTER_NAME=$1
VPC_ID=$2
REGION=${3:-"us-east-1"}

if [[ -z "$CLUSTER_NAME" || -z "$VPC_ID" ]]; then
  echo "Usage: ./install-addons.sh <cluster_name> <vpc_id> <region>"
  exit 1
fi

echo "===================================="
echo " Installing EKS Addons"
echo " Cluster: $CLUSTER_NAME"
echo " VPC ID:  $VPC_ID"
echo " Region:  $REGION"
echo "===================================="

###############################################
# Helper Function: Check if pod exists
###############################################
addon_exists() {
  NAMESPACE=$1
  LABEL=$2

  if kubectl get pods -n $NAMESPACE -l $LABEL 2>/dev/null | grep -q -v "No resources found"; then
    return 0
  else
    return 1
  fi
}

###############################################
# Helper Function: Wait for Pod
###############################################
wait_for_pod() {
  NAMESPACE=$1
  LABEL=$2
  echo "Waiting for pods in namespace '$NAMESPACE' with label '$LABEL'..."
  kubectl wait --for=condition=Ready pods -n $NAMESPACE -l $LABEL --timeout=300s || {
    echo "ERROR: Pods not ready for label $LABEL in $NAMESPACE"
    exit 1
  }
  echo "Pods are ready for $LABEL"
}

################################################
# 1. AWS LOAD BALANCER CONTROLLER
################################################
echo "-----------------------------------------"
echo "Checking AWS Load Balancer Controller..."
if addon_exists kube-system "app.kubernetes.io/name=aws-load-balancer-controller"; then
  echo "Already installed — skipping"
else
  echo "Installing AWS Load Balancer Controller"

  helm repo add eks https://aws.github.io/eks-charts || true
  helm repo update

  helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller \
    -n kube-system \
    --set clusterName=$CLUSTER_NAME \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-load-balancer-controller \
    --set region=$REGION \
    --set vpcId=$VPC_ID

  wait_for_pod kube-system "app.kubernetes.io/name=aws-load-balancer-controller"
fi


################################################
# 2. METRICS SERVER
################################################
echo "-----------------------------------------"
echo "Checking Metrics Server..."
if addon_exists kube-system "k8s-app=metrics-server"; then
  echo "Already installed — skipping"
else
  echo "Installing Metrics Server"
  kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
  wait_for_pod kube-system "k8s-app=metrics-server"
fi


################################################
# 3. CLUSTER AUTOSCALER
################################################
echo "-----------------------------------------"
echo "Checking Cluster Autoscaler..."
if addon_exists kube-system "app.kubernetes.io/name=aws-cluster-autoscaler"; then
  echo "Already installed — skipping"
else
  echo "Installing Cluster Autoscaler"

  helm repo add autoscaler https://kubernetes.github.io/autoscaler || true
  helm repo update

  helm upgrade --install cluster-autoscaler autoscaler/cluster-autoscaler \
    -n kube-system \
    --set autoDiscovery.clusterName=$CLUSTER_NAME \
    --set rbac.serviceAccount.create=false \
    --set rbac.serviceAccount.name=cluster-autoscaler \
    --set awsRegion=$REGION

  wait_for_pod kube-system "app.kubernetes.io/name=aws-cluster-autoscaler"
fi


################################################
# 4. AWS NODE TERMINATION HANDLER
################################################
echo "-----------------------------------------"
echo "Checking AWS Node Termination Handler..."
if addon_exists kube-system "app.kubernetes.io/name=aws-node-termination-handler"; then
  echo "Already installed — skipping"
else
  echo "Installing Node Termination Handler"

  helm repo add eks https://aws.github.io/eks-charts || true
  helm repo update

  helm upgrade --install aws-node-termination-handler eks/aws-node-termination-handler \
    -n kube-system \
    --set awsRegion=$REGION

  wait_for_pod kube-system "app.kubernetes.io/name=aws-node-termination-handler"
fi


################################################
# 5. AWS EBS CSI DRIVER
################################################
echo "-----------------------------------------"
echo "Checking AWS EBS CSI Driver..."
if addon_exists kube-system "app.kubernetes.io/name=aws-ebs-csi-driver"; then
  echo "Already installed — skipping"
else
  echo "Installing EBS CSI Driver"

  helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver || true
  helm repo update

  helm upgrade --install aws-ebs-csi-driver aws-ebs-csi-driver/aws-ebs-csi-driver \
    --namespace kube-system \
    --set controller.serviceAccount.create=false \
    --set controller.serviceAccount.name=ebs-csi-controller \
    --set node.serviceAccount.create=false \
    --set node.serviceAccount.name=ebs-csi-controller

  wait_for_pod kube-system "app.kubernetes.io/name=aws-ebs-csi-driver"
fi


################################################
# 6. EXTERNAL SECRETS OPERATOR
################################################
echo "-----------------------------------------"
echo "Checking External Secrets Operator..."
if addon_exists kube-system "app.kubernetes.io/name=external-secrets"; then
  echo "Already installed — skipping"
else
  echo "Installing External Secrets Operator"

  helm repo add external-secrets https://charts.external-secrets.io || true
  helm repo update

  helm upgrade --install external-secrets external-secrets/external-secrets \
    --namespace kube-system \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-secrets-manager

  wait_for_pod kube-system "app.kubernetes.io/name=external-secrets"
fi

################################################
echo "All Addons Installed Successfully!"
################################################