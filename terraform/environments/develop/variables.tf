variable "region" {
  type        = string
  description = "GCP resources location (e.g. europe-west9)"
}

variable "app_name" {
  type        = string
  description = "App name"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "environment" {
  type        = string
  description = "Infrastructure environment's name"
}

variable "default_labels" {
  type        = map(string)
  description = "default GCP labels applied to resources"
}