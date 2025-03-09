resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group

  sku               = "PerGB2018"
  retention_in_days = var.retention_in_days
}