output "log_analytics_workspace_id" {
  description = "ID of the created Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.log_analytics.id
}