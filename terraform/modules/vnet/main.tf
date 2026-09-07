resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.resource_group_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_address]

  tags = {
    project = "2048"
  }
}

resource "azurerm_subnet" "container_apps_subnet" {
  name                 = "container-apps-subnet-${var.resource_group_name}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.app_address_prefixes]
  service_endpoints    = [
    "Microsoft.ContainerRegistry"
  ]

  delegation {
    name = "container-apps-delegation"

    service_delegation {
      name    = "Microsoft.App/environments"
    }
  }
}