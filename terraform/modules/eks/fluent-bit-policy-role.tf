resource "aws_iam_policy" "fluent_bit_policy" {
  name        = "FluentBitPolicy"
  description = "Policy for Fluent Bit to push logs to CloudWatch"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ],
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role" "fluent_bit_role" {
  name = "FluentBitRole"

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
            "${replace(module.eks.cluster_oidc_issuer_url, "https://", "")}:sub" = "system:serviceaccount:kube-system:${var.fluentbit_service_account}"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "fluent_bit_policy_attachment" {
  role       = aws_iam_role.fluent_bit_role.name
  policy_arn = aws_iam_policy.fluent_bit_policy.arn
}

resource "kubernetes_service_account" "fluent_bit_sa" {
  metadata {
    name      = var.fluentbit_service_account
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.fluent_bit_role.arn
    }
  }
}

# Create a Secret to Bind the Token to the Service Account
resource "kubernetes_secret" "fluent_bit_token" {
  metadata {
    name      = "${var.fluentbit_service_account}-token"
    namespace = "kube-system"
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account.fluent_bit_sa.metadata[0].name
    }
  }

  type = "kubernetes.io/service-account-token"
}
