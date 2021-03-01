terraform {
  backend "gcs" {
    credentials = "google-key.json"
    bucket  = "testkontebucket"
    prefix  = "terraform/state"

  }
}