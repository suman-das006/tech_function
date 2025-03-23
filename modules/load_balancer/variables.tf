variable "function_name" {
  description = "The name of the cloud function"
  type        = string
}

variable "function_dependency" {
  description = "Dependency to ensure Cloud Function is created before Load Balancer"
  type        = string
}

variable "region" {}