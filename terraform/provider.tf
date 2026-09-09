terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.4.0"
    }
  }

  # Optional: Configure remote state storage
  backend "azurerm" {
    resource_group_name  = "terraform-state"
    storage_account_name = "tfproject"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}