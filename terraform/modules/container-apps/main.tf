resource "azurerm_log_analytics_workspace" "logs" {
  name                = "log-analytic-${var.resource_group_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = {
    project = "2048"
  }
}

resource "azurerm_container_app_environment" "environment" {
  name                       = "environment-${var.resource_group_name}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  logs_destination           = "log-analytics"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.logs.id
  infrastructure_subnet_id   = var.container_apps_subnet_id
  tags = {
    project = "2048"
  }                      

  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
  }

}


resource "azurerm_container_app" "app" {
  name                         = "container-app-${var.resource_group_name}"
  container_app_environment_id = azurerm_container_app_environment.environment.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"
  tags = {
    project = "2048"
  }                         

  registry {
    server   = var.acr_login_server
    identity = var.identity_id
  }

  template {
    min_replicas = 1
    max_replicas = 1

    container {
      name   = var.container_name
      image  = "${var.acr_login_server}/${var.container_name}:${var.container_image_tag}"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
   ingress {
    external_enabled = true
    target_port      = 3000

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }
}