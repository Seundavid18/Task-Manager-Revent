resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                = "agentpool"
    vm_size             = var.vm_size
    os_disk_size_gb     = var.os_disk_size_gb
    enable_auto_scaling = true
    min_count           = var.min_node_count
    max_count           = var.max_node_count
  }

  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.environment
  }
}

# Allow AKS to pull images from ACR
resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

# Check if Log Analytics Workspace exists
data "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.resource_group
}

# Azure Monitor (Log Analytics) for AKS
resource "azurerm_monitor_diagnostic_setting" "aks_logs" {
  count = var.enable_log_analytics ? 1 : 0  

  name                       = "${var.cluster_name}-diag-${var.environment}"
  target_resource_id         = azurerm_kubernetes_cluster.aks.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics.id

  enabled_log {
    category = "kube-audit"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }

  lifecycle {
    ignore_changes = [log_analytics_workspace_id]
  }
}