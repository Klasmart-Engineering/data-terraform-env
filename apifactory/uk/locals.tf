locals {
  # TFC inputs
  terraform_organization = "kidsloop-infrastructure"
  # working_directory      = basename(abspath("."))

  # Imported dependencies (mark as non-sensitive)
  dep_meta    = nonsensitive(data.tfe_outputs.meta.values)
  dep_account = nonsensitive(data.tfe_outputs.account.values)
  dep_network = nonsensitive(data.tfe_outputs.network.values)
  dep_cluster = nonsensitive(data.tfe_outputs.cluster.values)
  dep_tools   = nonsensitive(data.tfe_outputs.cluster-infra-tools.values)

  # Global EKS Variables
  cluster_endpoint                      = local.dep_cluster.cluster_endpoint
  cluster_id                            = local.dep_cluster.cluster_id
  kubeconfig_certificate_authority_data = local.dep_cluster.kubeconfig_certificate_authority_data

  # Infra tools EKS variables (for ArgoCD / Teleport)
  tools_region                                = "eu-west-2"
  tools_cluster_endpoint                      = local.dep_tools.cluster_endpoint
  tools_cluster_id                            = local.dep_tools.cluster_id
  tools_kubeconfig_certificate_authority_data = local.dep_tools.kubeconfig_certificate_authority_data
}
