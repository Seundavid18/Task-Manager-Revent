module "log_analytics" {
  source                       = "./modules/log-analytics"
  log_analytics_workspace_name = var.log_analytics_workspace_name
  resource_group               = var.resource_group
  location                     = var.location
  retention_in_days            = var.retention_in_days
}

module "aks" {
  source         = "./modules/aks"
  cluster_name   = var.cluster_name
  resource_group = var.resource_group
  acr_id         = module.acr.acr_id
  location       = var.location
  dns_prefix     = var.dns_prefix
  node_count     = var.node_count
  environment    = var.environment
  log_analytics_workspace_name   = var.log_analytics_workspace_name
  enable_log_analytics           = var.enable_log_analytics
  log_analytics_workspace_id  = module.log_analytics.log_analytics_workspace_id
  depends_on = [module.log_analytics]
}

module "acr" {
  source         = "./modules/acr"
  acr_name       = var.acr_name
  resource_group = var.resource_group
  location       = var.location
  environment    = var.environment
  log_analytics_workspace_name   = var.log_analytics_workspace_name
  enable_log_analytics           = var.enable_log_analytics
  log_analytics_workspace_id  = module.log_analytics.log_analytics_workspace_id
  depends_on = [module.log_analytics]
}

