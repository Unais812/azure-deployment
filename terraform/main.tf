module "networking" {
  source = "./modules/networking"
  resource_group_name = module.resource_groups.resouce_group_name
}

module "identity" {
  source = "./modules/identity"
  resource_group_name = module.resource_groups.resouce_group_name
  acr_id = var.acr_id
}

module "resource_groups" {
  source = "./modules/resource-groups"
}

module "container_app" {
  source = "./modules/container-apps"
  container_apps_subnet_id = module.networking.subnet_id
  acr_login_server = var.acr_login_server
  identity_id = module.identity.identity_id
  resource_group_name = module.resource_groups.resouce_group_name
}

