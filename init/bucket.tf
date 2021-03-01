resource "google_storage_bucket" "bucket" {
  project = var.project_id
  name = var.bucket
  location = "EU"
}