variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "resource_group" {
  description = "The name of the resource group where resources will be created"
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be deployed"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the Kubernetes API server"
  type        = string
}

variable "node_count" {
  description = "The initial number of nodes in the AKS cluster"
  type        = number
  default     = 1
}

variable "min_node_count" {
  description = "Minimum number of nodes for autoscaling"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes for autoscaling"
  type        = number
  default     = 3
}

variable "environment" {
  description = "The environment for deployment (e.g., dev, staging, prod)"
  type        = string
  default     = ""
}

variable "acr_id" {
  description = "The ID of the Azure Container Registry (ACR) for image pulling"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machines in the AKS node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "os_disk_size_gb" {
  description = "The OS disk size for each node in the AKS cluster"
  type        = number
  default     = 30
}


variable "kubernetes_version" {
  description = "The Kubernetes version to use for the cluster"
  type        = string
  default     = "1.26.6"
}

variable "network_plugin" {
  description = "The network plugin to use for the AKS cluster"
  type        = string
  default     = "azure"
}

variable "network_policy" {
  description = "The network policy to use for the AKS cluster"
  type        = string
  default     = "calico"
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