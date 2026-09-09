variable "resource_group_name" {
  description = "resource group name"
  type = string
}

variable "location" {
  description = "location"
  type = string
  default = "UK West"
}

variable "container_apps_subnet_id" {
  description = "ids of subnets"
  type = string
}

variable "acr_login_server" {
  description = "fqdn of acr server"
  type = string
}

variable "identity_id" {
  description = "identity id for container app"
  type = string
}

variable "container_name" {
  description = "name of container"
  type = string
  default = "container-apps-2048"
}

variable "container_image_tag" {
  description = "tag of image"
  type = string
  default = "latest"
}
