terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.76.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.10.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "felipediasterraformstate"
    container_name       = "remote-state"
    key                  = "pipeline-github/terraform.tfstate"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "felipedias"
      managed-by = "terraform"
    }
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "felipedias-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "felipediasterraformstate"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }
}