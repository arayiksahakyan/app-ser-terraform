variable "name" {
  description = "Traffic Manager profile name."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name for the Traffic Manager profile."
  type        = string
}

variable "traffic_routing_method" {
  description = "Traffic routing method for the Traffic Manager profile."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Traffic Manager profile."
  type        = map(string)
}

variable "endpoints" {
  description = "Azure endpoints for the Traffic Manager profile."
  type = map(object({
    name               = string
    target_resource_id = string
    priority           = number
    weight             = number
  }))
}
