variable "resource_group_name" {
  description = "resource group name"
  type = string
}

variable "location" {
  description = "location"
  type = string
  default = "UK West"
}

variable "acr_id" {
  description = "id of acr"
  type = string
}