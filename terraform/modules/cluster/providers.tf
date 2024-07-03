provider "google" {
  project = var.project_id
  region  = var.region

  add_terraform_attribution_label               = true
  terraform_attribution_label_addition_strategy = "PROACTIVE"
  default_labels                                = merge(var.default_labels, { environment = var.environment })
}