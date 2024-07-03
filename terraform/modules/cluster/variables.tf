variable "region" {
  type        = string
  description = "GCP resources location (e.g. europe-west9)"
}

variable "environment" {
  type        = string
  description = "Infrastructure environment's name"
}

variable "app_name" {
  type        = string
  description = "App name"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "default_labels" {
  type        = map(string)
  description = "default GCP labels applied to resources"
}

variable "node_pools" {
  type = map(object({
    machine_type   = string
    max_node_count = number
    tags           = list(string)
    })
  )
  description = "GKE cluster node pools configuration"
}
