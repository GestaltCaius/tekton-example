resource "google_container_cluster" "main" {
  name     = local.app_name
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  deletion_protection = false

  resource_labels = var.default_labels

}

resource "google_container_node_pool" "main" {
  for_each = var.node_pools

  name     = each.key
  location = var.region
  cluster  = google_container_cluster.main.name
  #   node_count = 1

  node_config {
    spot         = true
    machine_type = each.value.machine_type # "e2-micro"
    disk_size_gb = 10

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.gke.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    tags = concat(
      ["gke-nodes"],
      each.value.tags
    )

    labels = var.default_labels
  }

  autoscaling {
    total_min_node_count = 0
    total_max_node_count = each.value.max_node_count
    location_policy      = "ANY" # because we use spot VMs
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}

data "google_client_config" "default" {
}
