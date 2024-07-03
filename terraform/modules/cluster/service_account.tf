resource "random_id" "gke_sa_suffix" {
  byte_length = 4
}

resource "google_service_account" "gke" {
  account_id   = "${local.app_name}-gke-${random_id.gke_sa_suffix.hex}"
  display_name = "${local.app_name} GKE Cluster Service Account"
}
