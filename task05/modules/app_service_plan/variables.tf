variable "name" {
  description = "App Service Plan name."
  type        = string
}

variable "location" {
  description = "App Service Plan location."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name for the App Service Plan."
  type        = string
}

variable "sku_name" {
  description = "SKU name for the App Service Plan."
  type        = string
}

variable "worker_count" {
  description = "Worker instance count for the App Service Plan."
  type        = number
}

variable "tags" {
  description = "Tags to apply to the App Service Plan."
  type        = map(string)
}
