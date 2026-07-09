terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # "any 5.x version"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# This tells Terraform:
# Use the AzureRM provider
# Use provider version x.0 or higher
# Deploy resources into Azure