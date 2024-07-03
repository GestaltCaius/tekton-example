module "cluster" {
  source = "../../modules/cluster"

  region         = var.region
  project_id     = var.project_id
  default_labels = var.default_labels
  environment    = var.environment
  app_name       = var.app_name

  node_pools = {
    main = {
      machine_type   = "e2-small"
      max_node_count = 10
      tags           = ["gke-tekton-pool"]
    }
  }
}

module "tekton" {
  source = "../../modules/tekton"

  host                   = module.cluster.host
  cluster_ca_certificate = module.cluster.cluster_ca_certificate
  token                  = module.cluster.token

  tekton_version = "v0.71.0"
}