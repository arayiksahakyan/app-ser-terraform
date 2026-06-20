module "resource_group" {
  source = "./modules/resource_group"

  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = var.tags
}

module "app_service_plan" {
  source = "./modules/app_service_plan"

  for_each = var.app_service_plans

  name                = each.value.name
  location            = module.resource_group[each.value.resource_group_key].location
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  sku_name            = each.value.sku_name
  worker_count        = each.value.worker_count
  tags                = var.tags
}

module "app_service" {
  source = "./modules/app_service"

  for_each = var.app_services

  name                = each.value.name
  location            = module.resource_group[each.value.resource_group_key].location
  resource_group_name = module.resource_group[each.value.resource_group_key].name
  service_plan_id     = module.app_service_plan[each.value.app_service_plan_key].id
  tags                = var.tags

  access_restrictions = [
    {
      name       = each.value.allow_ip_rule_name
      priority   = 100
      action     = "Allow"
      ip_address = each.value.allowed_ip_address
    },
    {
      name        = each.value.allow_tag_rule_name
      priority    = 110
      action      = "Allow"
      service_tag = "AzureTrafficManager"
    }
  ]
}

module "traffic_manager" {
  source = "./modules/traffic_manager"

  name                   = var.traffic_manager.name
  resource_group_name    = module.resource_group[var.traffic_manager.resource_group_key].name
  traffic_routing_method = var.traffic_manager.traffic_routing_method
  tags                   = var.tags

  endpoints = {
    app1 = {
      name               = "${var.app_services.app1.name}-endpoint"
      target_resource_id = module.app_service["app1"].id
      priority           = 1
      weight             = 100
    }

    app2 = {
      name               = "${var.app_services.app2.name}-endpoint"
      target_resource_id = module.app_service["app2"].id
      priority           = 2
      weight             = 100
    }
  }
}
