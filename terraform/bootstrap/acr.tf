resource "azurerm_container_registry" "acr" {
  name                = "acrterraformproject"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false
  
  tags = {
    project = "2048"
  }

  depends_on = [ 
    azurerm_resource_group.resource_group 
    ]

}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

variable "resource_group_name" {
  description = "resource group name"
  type = string
  default = "acr-resource-group"
}

variable "location" {
  description = "location"
  type = string
  default = "UK West"
}

output "login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
}