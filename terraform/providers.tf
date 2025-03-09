terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.66"
    }
  }

  backend "azurerm" {
    resource_group_name   = "Revent-task-rg"
    storage_account_name  = "reventtaskstg"
    container_name        = "tfstate"
    key                   = "backend.tfstate"
  }
}

provider "azurerm" {
  features {}
}