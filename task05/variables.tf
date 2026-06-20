variable "tags" {
  description = "Tags to apply to required resources."
  type        = map(string)
}

variable "resource_groups" {
  description = "Resource groups configuration."
  type = map(object({
    name     = string
    location = string
  }))
}

variable "app_service_plans" {
  description = "App Service Plans configuration."
  type = map(object({
    name               = string
    resource_group_key = string
    sku_name           = string
    worker_count       = number
  }))
}

variable "app_services" {
  description = "Windows App Services configuration."
  type = map(object({
    name                 = string
    resource_group_key   = string
    app_service_plan_key = string
    allow_ip_rule_name   = string
    allow_tag_rule_name  = string
    allowed_ip_address   = string
  }))
}

variable "traffic_manager" {
  description = "Traffic Manager profile configuration."
  type = object({
    name                   = string
    resource_group_key     = string
    traffic_routing_method = string
  })
}
