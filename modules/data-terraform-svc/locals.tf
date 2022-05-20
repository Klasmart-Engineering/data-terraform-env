locals {
  region              = var.region
  project_environment = var.project_environment
  project_region      = var.project_region
  service_owner       = var.service_owner

  tags = merge(
    var.tags,
    {
      OWNER_GROUP     = var.service_owner
      OWNER_SUB_GROUP = var.service_owner
      ENVIRONMENT     = var.project_environment
      SERVICE_GROUP  = "data-services"
    }
  )

  # Passthrough
  vpc_id       = var.vpc_id
  name_prefix  = "${var.project}-${var.project_region}-${var.project_environment}"
}
