variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "resource_group" {
  description = "The resource group where the ACR will be created"
  type        = string
}

variable "location" {
  description = "The Azure region where the ACR will be deployed"
  type        = string
}

variable "environment" {
  description = "The environment for deployment"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
}

variable "enable_log_analytics" {
  description = "Enable monitoring with Azure Monitor (Log Analytics)"
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "Azure Log Analytics Workspace ID for monitoring"
  type        = string
}

variable "retention_in_days" {
  description = "Log retention period in days"
  type        = number
  default     = 30
}