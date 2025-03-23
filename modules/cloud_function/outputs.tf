output "function_name" {
  description = "The name of the deployed cloud function"
  value       = google_cloudfunctions_function.tech_function.name
}