resource "azurerm_resource_group" "react-app-resource2" {
  name     = "react-app-resource2"
  location = "West US"
}

resource "azurerm_container_registry" "azurereactappneilacostaregistry" {
 
  name                = "azurereactappneilacostaregistry"
  resource_group_name = azurerm_resource_group.react-app-resource2.name
  location            = azurerm_resource_group.react-app-resource2.location
  sku                 = "Standard"
  admin_enabled       = true # required for App Service as Admin - ONLY FOR TESTING
}

resource "azurerm_service_plan" "react-app-resource2-service_plan_id" {
  name                = "react-app-resource2-service_plan_id"
  resource_group_name = azurerm_resource_group.react-app-resource2.name
  location            = azurerm_resource_group.react-app-resource2.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "neilacosta-web-react-app-tf" {
  name                = "neilacosta-web-react-app-tf"
  resource_group_name = azurerm_resource_group.react-app-resource2.name
  location            = azurerm_service_plan.react-app-resource2-service_plan_id.location
  service_plan_id     = azurerm_service_plan.react-app-resource2-service_plan_id.id
  
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    WEBSITES_PORT                       = "80"
  }


  site_config {
    always_on = "false" #always_on must be explicitly set to false when using Free, F1, D1, or Shared Service Plans.
    application_stack {
  docker_image_name        = "neildockerimageappreact:latest"
  docker_registry_url      = "https://${azurerm_container_registry.azurereactappneilacostaregistry.login_server}"
  docker_registry_username = azurerm_container_registry.azurereactappneilacostaregistry.admin_username
  docker_registry_password = azurerm_container_registry.azurereactappneilacostaregistry.admin_password
}
  }
}


