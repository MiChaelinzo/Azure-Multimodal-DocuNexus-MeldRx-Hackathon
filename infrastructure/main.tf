terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" { # Optional: Configure Azure Storage Account for Terraform state backend for team collaboration
    resource_group_name  = "your-terraform-state-rg"
    storage_account_name = "yourterraformstateacc"
    container_name       = "tfstate"
    key                  = "docunexus.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "docunexus_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "docunexus_service_plan" {
  name                = var.service_plan_name
  location            = azurerm_resource_group.docunexus_rg.location
  resource_group_name = azurerm_resource_group.docunexus_rg.name
  os_type             = "Linux"
  sku_name            = "B1" # Basic tier - adjust as needed
}

resource "azurerm_linux_web_app" "docunexus_app_service" {
  name                = var.app_service_name
  location            = azurerm_resource_group.docunexus_rg.location
  resource_group_name = azurerm_resource_group.docunexus_rg.name
  service_plan_id     = azurerm_service_plan.docunexus_service_plan.id
  https_only          = true # Enforce HTTPS

  site_config {
    python_version = "3.10" # Match your runtime.txt
  }

  app_settings = {
    "GEMINI_API__API_KEY"            = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.gemini_api_key.id})" # Example using Azure Key Vault - more secure
    "MELDRX_SYS_APP__CLIENT_ID"      = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.meldrx_client_id.id})" # Example using Azure Key Vault - more secure
    "MELDRX_SYS_APP__CLIENT_SECRET"  = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.meldrx_client_secret.id})" # Example using Azure Key Vault - more secure
    "WEBSITE_HTTPLOGGING_ENABLED" = "1" # Enable HTTP logs for debugging
  }

  # Deployment settings (optional - if using zip deploy or Git deploy via Terraform)
  # source_control {
  #   repo_url     = "https://github.com/YourGitHubUsername/DocuNexus-MeldRx-Hackathon"
  #   branch       = "main"
  #   manual_integration = false
  # }
}

# Example Azure Key Vault and Secrets (More Secure Secret Management)
resource "azurerm_key_vault" "docunexus_keyvault" {
  name                = var.key_vault_name
  location            = azurerm_resource_group.docunexus_rg.location
  resource_group_name = azurerm_resource_group.docunexus_rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  purge_protection_enabled = false # Set to true for production

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id # Your Azure AD User/Service Principal Object ID - for initial setup
    permission_secrets = [
      "Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge" # Full control for initial setup - adjust in production
    ]
  }
}

resource "azurerm_key_vault_secret" "gemini_api_key" {
  name         = "GeminiApiKey"
  key_vault_id = azurerm_key_vault.docunexus_keyvault.id
  value        = "YOUR_GEMINI_API_KEY" # Replace with your actual Gemini API Key - or use placeholder for judges to configure
}

resource "azurerm_key_vault_secret" "meldrx_client_id" {
  name         = "MeldRxClientId"
  key_vault_id = azurerm_key_vault.docunexus_keyvault.id
  value        = "YOUR_MELDRX_CLIENT_ID" # Replace with your MeldRx Client ID - or use placeholder
}

resource "azurerm_key_vault_secret" "meldrx_client_secret" {
  name         = "MeldRxClientSecret"
  key_vault_id = azurerm_key_vault.docunexus_keyvault.id
  value        = "YOUR_MELDRX_CLIENT_SECRET" # Replace with your MeldRx Client Secret - or use placeholder
}

data "azurerm_client_config" "current" {} # Get current Azure client config for Key Vault access policy
