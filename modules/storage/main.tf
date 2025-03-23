resource "google_storage_bucket" "tech_bucket" { 
  name          = var.bucket_name
  location      = var.location
  force_destroy = true
}

resource "google_storage_bucket_object" "archive" {
  name   = var.archive_name
  bucket = google_storage_bucket.tech_bucket.name
  source = "./codebase.zip"
}