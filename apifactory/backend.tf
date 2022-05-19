terraform {
  cloud {
    organization = "kidsloop-infrastructure"
    workspaces {
      name = "data-services-apifactory"
    }
  }
}
