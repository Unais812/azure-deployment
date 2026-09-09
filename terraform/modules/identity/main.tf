resource "azurerm_user_assigned_identity" "main" {
  location            = var.location
  name                = "identity-${var.resource_group_name}"
  resource_group_name = var.resource_group_name
  tags = {
    project = "2048"
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.main.principal_id
  principal_type       = "ServicePrincipal"
}