variable "resource_group_name" {
  description = "resource group name"
  type = string
}

variable "location" {
  description = "location"
  type = string
  default = "UK West"
}

variable "vnet_address" {
  description = "address of the vnet"
  type = string
  default = "10.0.0.0/16"
}

variable "app_address_prefixes" {
  description = "prefix of container apps subnet"
  type = string
  default = "10.0.1.0/24"
}