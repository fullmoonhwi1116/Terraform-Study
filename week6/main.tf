

#KEYVALUT
resource "azurerm_key_vault" "rg" {
  name                = "kvault-hwi-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "get", "list", "create", "delete", "update",
    ]
    secret_permissions = [
      "get", "list", "set", "delete",
    ]
  }
}

#Keyvalut로stroage
resource "azurerm_storage_account" "rg" {
  name                     = "remotes-hwi-01"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "koreacentral" 
  account_tier             = "Standard"
  account_replication_type = "ZRS"
}