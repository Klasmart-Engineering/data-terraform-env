module "service_instance" {
  # Module import info here
  source  = "app.terraform.io/kidsloop-infrastructure/svc-data/aws"
  version = "0.1.0"

  # Passthrough inputs
  region              = local.dep_meta.region
  project_environment = local.dep_meta.project_environment
  project_region      = local.dep_meta.project_region
  service_owner       = local.dep_meta.service_owner
  tags                = local.dep_meta.tags

  eks_oidc_provider_arn = local.dep_cluster.eks_oidc_provider_arn
  eks_oidc_provider_id  = local.dep_cluster.eks_oidc_provider_id

  logs_bucket_id = local.dep_account.logs_bucket_id

  # Kubernetes
  kubernetes_server_url = local.cluster_endpoint
  argocd_namespace =
  argocd_project =
  helm_chart_url = "git@github.com:KL-Engineering/data-manifests.git"
  helm_chart_revision = "HEAD"

  providers = {
    aws            = aws
    kubernetes     = kubernetes
  }
}
