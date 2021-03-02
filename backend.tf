terraform {
  backend "gcs" {
    credentials = "google-key.json"
    bucket  = "kontebucket"
    prefix  = "terraform/state"

  }
}