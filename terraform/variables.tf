variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "resource_group" {
  description = "Resource group where all resources will be created"
  type        = string
}

variable "location" {
  description = "Azure location where resources will be deployed"
  type        = string
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
}

variable "acr_name" {
  description = "Azure Container Registry (ACR) name"
  type        = string
}

# Log Analytics Variables
variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics Workspace"
  type        = string
}

variable "enable_log_analytics" {
  description = "Enable monitoring with Azure Monitor (Log Analytics)"
  type        = bool
  default     = true
}

variable "retention_in_days" {
  description = "Log retention period in days"
  type        = number
  default     = 30
}