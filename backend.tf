terraform {
  backend "gcs" {
    credentials = "google-key.json"
    bucket  = ""
    prefix  = "terraform/state"

  }
}