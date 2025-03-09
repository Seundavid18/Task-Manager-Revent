resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false

  tags = {
    Environment = var.environment
  }
}

# Check if Log Analytics Workspace exists
data "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.resource_group
}

# Azure Monitor (Log Analytics) for ACR
resource "azurerm_monitor_diagnostic_setting" "acr_logs" {
  count = var.enable_log_analytics ? 1 : 0  
  
  name                       = "${var.acr_name}-diag-${var.environment}"
  target_resource_id         = azurerm_container_registry.acr.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics.id

  enabled_log {
    category = "ContainerRegistryLoginEvents"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }

  lifecycle {
    ignore_changes = [log_analytics_workspace_id]
  }
}