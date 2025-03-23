variable "bucket_name" {
  default = "hello-world240325"
  type = string
}

variable "location" {
  default = "US-EAST1"
  type = string
}

variable "archive_name" {
  default = "codebase.zip"
  type = string
}

variable "function_name" {
  default = "tech_function"
  type = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "entry_point" {
  description = "Function entry point"
  type        = string
  default     = "hello_world"
}

variable "role" {
  description = "IAM Role for Cloud Function access"
  type        = string
  default     = "roles/cloudfunctions.invoker"
}