resource "azurerm_resource_group" "resource_group" {
  name     = ""
  location = ""

  tags = ""
}

resource "azurerm_storage_account" "storage_account" {
  name                     = ""
  resource_group_name      = ""
  location                 = ""
  account_tier             = ""
  account_replication_type = ""

  tags = ""
}  

resource "azurerm_storage_container" "storage_container" {
  name                  = ""
  storage_account_name  = ""
}