variable "automation_account_name" {
  type        = string
  description = "The name of the Azure Automation Account to create."
}

variable "location" {
  type        = string
  description = "The Azure region where the resources will be deployed."
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "The name of the Log Analytics Workspace to create."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group where the resources will be created."
}

variable "automation_account_encryption" {
  type = object({
    key_vault_key_id          = string
    user_assigned_identity_id = optional(set(string))
  })
  description = "The encryption configuration for the Azure Automation Account."
  default     = null
}

variable "automation_account_identity" {
  type = object({
    type         = string
    identity_ids = optional(set(string))
  })
  description = "The identity to assign to the Azure Automation Account."
  default     = null
}

variable "automation_account_local_authentication_enabled" {
  type        = bool
  description = "Whether or not local authentication is enabled for the Azure Automation Account."
  default     = true
}

variable "automation_account_public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is enabled for the Azure Automation Account."
  default     = true
}

variable "automation_account_sku_name" {
  type        = string
  description = "The name of the SKU for the Azure Automation Account to create."
  default     = "Basic"
}

variable "deploy_linked_automation_account" {
  type        = bool
  description = "A boolean flag to determine whether to deploy the Azure Automation Account linked to the Log Analytics Workspace or not."
  default     = true
}

variable "deploy_resource_group" {
  type        = bool
  description = "A boolean flag to determine whether to deploy the Azure Resource Group or not."
  default     = true
}

variable "log_analytics_workspace_allow_resource_only_permissions" {
  type        = bool
  description = "Whether or not to allow resource-only permissions for the Log Analytics Workspace."
  default     = false
}

variable "log_analytics_workspace_cmk_for_query_forced" {
  type        = bool
  description = "Whether or not to force the use of customer-managed keys for query in the Log Analytics Workspace."
  default     = null
}

variable "log_analytics_workspace_daily_quota_gb" {
  type        = number
  description = "The daily ingestion quota in GB for the Log Analytics Workspace."
  default     = null
}

variable "log_analytics_workspace_internet_ingestion_enabled" {
  type        = bool
  description = "Whether or not internet ingestion is enabled for the Log Analytics Workspace."
  default     = true
}

variable "log_analytics_workspace_internet_query_enabled" {
  type        = bool
  description = "Whether or not internet query is enabled for the Log Analytics Workspace."
  default     = true
}

variable "log_analytics_workspace_reservation_capacity_in_gb_per_day" {
  type        = number
  description = "The reservation capacity in GB per day for the Log Analytics Workspace."
  default     = null
}

variable "log_analytics_workspace_retention_in_days" {
  type        = number
  description = "The number of days to retain data for the Log Analytics Workspace."
  default     = 30
}

variable "log_analytics_solution_names" {
  type        = list(string)
  description = "The name of the Log Analytics Solution to create."
  default = [
    "AgentHealthAssessment",
    "AntiMalware",
    "ChangeTracking",
    "ContainerInsights",
    "Security",
    "SecurityInsights",
    "ServiceMap",
    "SQLAdvancedThreatProtection",
    "SQLAssessment",
    "SQLVulnerabilityAssessment",
    "Updates",
    "VMInsights",
  ]
}

variable "log_analytics_workspace_sku" {
  type        = string
  description = "The SKU to use for the Log Analytics Workspace."
  default     = "PerGB2018"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to the resources created."
  default     = {}
}
