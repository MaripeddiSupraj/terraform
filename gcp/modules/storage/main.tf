resource "google_storage_bucket" "this" {
  name     = var.bucket_name
  location = var.location

  versioning {
    enabled = var.versioning_enabled
  }

  uniform_bucket_level_access = true

  labels = {
    environment = var.environment
  }
}
