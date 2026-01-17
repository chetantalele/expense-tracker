resource "kubernetes_service_account_v1" "alb_controller" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"

    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.alb_controller.arn
    }
  }
}

resource "helm_release" "alb_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.7.1"
  namespace  = "kube-system"

  timeout = 600
  wait    = true

  set {
    name  = "clusterName"
    value = aws_eks_cluster.cluster.name
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = kubernetes_service_account_v1.alb_controller.metadata[0].name
  }

  set {
    name  = "region"
    value = "ap-south-1"
  }

  depends_on = [
    aws_eks_node_group.nodes,
    aws_iam_openid_connect_provider.eks,
    aws_iam_role_policy_attachment.alb_attach,
    kubernetes_service_account_v1.alb_controller
  ]
}
