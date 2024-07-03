terraform {
  backend "gcs" {
    bucket = null # override me
    prefix = "terraform/state"
  }
}