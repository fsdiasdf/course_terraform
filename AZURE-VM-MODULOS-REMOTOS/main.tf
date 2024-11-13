terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.9.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"         # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "felipediasterraformstate"   # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "remote-state"               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "azure-vm-modulos-remotos/terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {}
}


module "network" {
  source  = "Azure/network/azurerm"
  version = "5.2.0"
  resource_group_name = azurerm_resource_group.resource_group.name
  use_for_each = true
  subnet_names = ["subnet-{var.environment}"]
  tags = local.common_tags
  vnet_name = "vnet-${var.environment}"
}