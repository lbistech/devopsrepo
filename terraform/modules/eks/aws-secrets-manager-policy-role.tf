resource "aws_iam_policy" "secrets_manager_policy" {
  name        = "EKSSecretsManagerPolicy"
  description = "IAM policy for AWS Secrets Manager integration with EKS"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
        "secretsmanager:GetResourcePolicy",
        "secretsmanager:GetSecretValue",
        "secretsmanager:DescribeSecret",
        "secretsmanager:ListSecretVersionIds"
        ],
        Resource = [
          "arn:aws:secretsmanager:*:*:secret:*"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "secrets_manager_role" {
  name = "EKSSecretsManagerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${replace(module.eks.cluster_oidc_issuer_url, "https://", "")}"
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          "StringEquals" = {
            "${replace(module.eks.cluster_oidc_issuer_url, "https://", "")}:sub" = "system:serviceaccount:kube-system:${var.aws_secrets_service_account}"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "secrets_manager_policy_attachment" {
  role       = aws_iam_role.secrets_manager_role.name
  policy_arn = aws_iam_policy.secrets_manager_policy.arn
}

resource "kubernetes_service_account" "aws_secrets_manager_sa" {
  metadata {
    name      = var.aws_secrets_service_account
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.secrets_manager_role.arn
    }
  }
}

# Create a Secret to Bind the Token to the Service Account
resource "kubernetes_secret" "aws_secrets_manager_token" {
  metadata {
    name      = "${var.aws_secrets_service_account}-token"
    namespace = "kube-system"
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account.aws_secrets_manager_sa.metadata[0].name
    }
  }

  type = "kubernetes.io/service-account-token"
}