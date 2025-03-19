variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "docunexus-hackathon-rg" # Default RG name - judges can change
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources"
  default     = "eastus" # Default region - judges can change
}

variable "service_plan_name" {
  type        = string
  description = "Name of the App Service Plan"
  default     = "docunexus-appservice-plan" # Default App Service Plan name
}

variable "app_service_name" {
  type        = string
  description = "Name of the Linux Web App (App Service)"
  default     = "docunexus-web-app" # Default Web App name
}

variable "key_vault_name" {
  type        = string
  description = "Name of the Azure Key Vault"
  default     = "docunexus-keyvault-name" # Default Key Vault name
}
