tags = {
  Creator = "arayik_sahakyan@epam.com"
}

resource_groups = {
  rg1 = {
    name     = "cmaz-2gvu1fsw-mod5-rg-01"
    location = "westeurope"
  }

  rg2 = {
    name     = "cmaz-2gvu1fsw-mod5-rg-02"
    location = "northeurope"
  }

  rg3 = {
    name     = "cmaz-2gvu1fsw-mod5-rg-03"
    location = "uksouth"
  }
}

app_service_plans = {
  asp1 = {
    name               = "cmaz-2gvu1fsw-mod5-asp-01"
    resource_group_key = "rg1"
    sku_name           = "S1"
    worker_count       = 2
  }

  asp2 = {
    name               = "cmaz-2gvu1fsw-mod5-asp-02"
    resource_group_key = "rg2"
    sku_name           = "S1"
    worker_count       = 1
  }
}

app_services = {
  app1 = {
    name                 = "cmaz-2gvu1fsw-mod5-app-01"
    resource_group_key   = "rg1"
    app_service_plan_key = "asp1"
    allow_ip_rule_name   = "allow-ip"
    allow_tag_rule_name  = "allow-tm"
    allowed_ip_address   = "18.153.146.156/32"
  }

  app2 = {
    name                 = "cmaz-2gvu1fsw-mod5-app-02"
    resource_group_key   = "rg2"
    app_service_plan_key = "asp2"
    allow_ip_rule_name   = "allow-ip"
    allow_tag_rule_name  = "allow-tm"
    allowed_ip_address   = "18.153.146.156/32"
  }
}

traffic_manager = {
  name                   = "cmaz-2gvu1fsw-mod5-traf"
  resource_group_key     = "rg3"
  traffic_routing_method = "Performance"
}
