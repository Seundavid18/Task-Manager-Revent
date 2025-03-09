variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
}

variable "resource_group" {
  description = "Resource group where Log Analytics Workspace will be created"
  type        = string
}

variable "location" {
  description = "Azure location where Log Analytics Workspace will be created"
  type        = string
}

variable "retention_in_days" {
  description = "Log retention period in days"
  type        = number
  default     = 30
}