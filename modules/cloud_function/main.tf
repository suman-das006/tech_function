resource "google_cloudfunctions_function" "tech_function" {
  name        = var.function_name
  runtime     = "python311"
  region      = var.region
  entry_point = var.entry_point

  available_memory_mb   = 128
  source_archive_bucket = var.bucket_name
  source_archive_object = var.archive_name

  trigger_http = true
  https_trigger_security_level = "SECURE_ALWAYS"

  lifecycle {
    ignore_changes = [source_archive_object]
  }
}

resource "google_cloudfunctions_function_iam_member" "function_im_users" {
  project        = google_cloudfunctions_function.tech_function.project
  region         = google_cloudfunctions_function.tech_function.region
  cloud_function = google_cloudfunctions_function.tech_function.name
  role           = var.role
  member         = "allUsers" 
}