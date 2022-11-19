
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnet

  name                 = each.value["name"]
  resource_group_name  = each.value["resource_group_name"]
  virtual_network_name = each.value["virtual_network_name"]
  address_prefixes     = each.value["address_prefixes"]
  depends_on           = [azurerm_virtual_network.vnet]
}

locals {
  subnets = {
    for key, value in azurerm_subnet.subnet : key => value
  }
}

output "app_subnet" {
  value = lookup(local.subnets, "app_subnet", "not_found")
}