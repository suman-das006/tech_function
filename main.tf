module "storage" {
  source       = "./modules/storage"
  bucket_name  = var.bucket_name
  location     = var.location
  archive_name = var.archive_name
}

module "cloud_function" {
  source        = "./modules/cloud_function"
  function_name = var.function_name
  location      = var.location
  region        = var.region
  entry_point   = var.entry_point
  role          = var.role
  bucket_name   = module.storage.bucket_name
  archive_name  = module.storage.archive_name
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  function_name       = module.cloud_function.function_name
  function_dependency = module.cloud_function.function_name
  region              = var.region
}