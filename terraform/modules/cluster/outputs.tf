output "cluster_ca_certificate" {
  value = base64decode(google_container_cluster.main.master_auth[0].cluster_ca_certificate)
}

output "host" {
  value = "https://${google_container_cluster.main.endpoint}"
}

output "token" {
  value     = data.google_client_config.default.access_token
  sensitive = true
}
