resource "azurerm_resource_group" "react-app-resource" {
  name     = "react-app-resource"
  location = "East US"
}

resource "azurerm_service_plan" "react-app-resource-service_plan_id" {
  name                = "react-app-resource-service_plan_id"
  resource_group_name = azurerm_resource_group.react-app-resource.name
  location            = azurerm_resource_group.react-app-resource.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "web-react-app-neilacosta-tf" {
  name                = "web-react-app-neilacosta-tf"
  resource_group_name = azurerm_resource_group.react-app-resource.name
  location            = azurerm_service_plan.react-app-resource-service_plan_id.location
  service_plan_id     = azurerm_service_plan.react-app-resource-service_plan_id.id

  site_config {
    always_on        = true
    app_command_line = ""
    linux_fx_version = "DOCKER|azurereactappneilacosta/neilacostareactweb:32"
    }
}