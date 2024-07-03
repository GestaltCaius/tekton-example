variable "cluster_ca_certificate" {
  type        = string
  description = "K8s cluster certificate"
}

variable "host" {
  type        = string
  description = "K8s cluster hostname (endpoint)"
}

variable "token" {
  type        = string
  description = "K8s cluster access token"
}

variable "tekton_version" {
  type        = string
  description = "tekton version (e.g. 'v0.71.0')"
}