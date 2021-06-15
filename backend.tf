terraform {
  backend "gcs" {
    credentials = "google-key.json"
    bucket  = "test-bucket-1234121"
    prefix  = "terraform/state"

  }
}
