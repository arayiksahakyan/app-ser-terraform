variable "name" {
  description = "Windows Web App name."
  type        = string
}

variable "location" {
  description = "Windows Web App location."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name for the Windows Web App."
  type        = string
}

variable "service_plan_id" {
  description = "App Service Plan ID used by the Windows Web App."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Windows Web App."
  type        = map(string)
}

variable "access_restrictions" {
  description = "Access restriction rules for the Windows Web App."
  type = list(object({
    name        = string
    priority    = number
    action      = string
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}
