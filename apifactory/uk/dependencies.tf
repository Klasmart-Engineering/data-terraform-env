data "tfe_outputs" "meta" {
  organization = local.terraform_organization
  workspace    = "meta-${local.working_directory}"
}

data "tfe_outputs" "account" {
  organization = local.terraform_organization
  workspace    = "account-${local.working_directory}"
}

data "tfe_outputs" "network" {
  organization = local.terraform_organization
  workspace    = "network-${local.working_directory}"
}

data "tfe_outputs" "cluster" {
  organization = local.terraform_organization
  workspace    = "cluster-${local.working_directory}"
}

data "tfe_outputs" "service-meta-data" {
  organization = local.terraform_organization
  workspace    = "service-meta-data"
}
