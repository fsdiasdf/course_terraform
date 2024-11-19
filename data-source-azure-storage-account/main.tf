terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.10.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "felipediasterraformstate"
    container_name       = "remote-state"
    key                  = "data-source/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}