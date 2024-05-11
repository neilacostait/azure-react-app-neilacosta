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
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "neilacosta-web-react-app-tf" {
  name                = "neilacosta-web-react-app-tf"
  resource_group_name = azurerm_resource_group.react-app-resource2.name
  location            = azurerm_service_plan.react-app-resource2-service_plan_id.location
  service_plan_id     = azurerm_service_plan.react-app-resource2-service_plan_id.id
  
  app_settings = {
  #  DOCKER_REGISTRY_SERVER_URL          = azurerm_container_registry.azurereactappneilacostaregistry.login_server
  #  DOCKER_REGISTRY_SERVER_USERNAME     = azurerm_container_registry.azurereactappneilacostaregistry.admin_username
  #  DOCKER_REGISTRY_SERVER_PASSWORD     = azurerm_container_registry.azurereactappneilacostaregistry.admin_password
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    WEBSITES_PORT                       = "80"
  #  DOCKER_CUSTOM_IMAGE_NAME            = "${azurerm_container_registry.azurereactappneilacostaregistry.login_server}/neildockerimageappreact:latest"
  }
  #app_settings = {
  #  DOCKER_REGISTRY_SERVER_URL      = var.DOCKER_REGISTRY_SERVER_URL
  #  DOCKER_REGISTRY_SERVER_USERNAME = var.DOCKER_REGISTRY_SERVER_USERNAME
  #  DOCKER_REGISTRY_SERVER_PASSWORD = var.DOCKER_REGISTRY_SERVER_PASSWORD
  #  WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
  #  WEBSITES_PORT = "3000" #use for testing
  #  DOCKER_CUSTOM_IMAGE_NAME    = var.DOCKER_CUSTOM_IMAGE_NAME
  #}

  site_config {
    always_on = "true"
    application_stack {
  docker_image_name        = "${azurerm_container_registry.azurereactappneilacostaregistry.name}/neildockerimageappreact:latest"
  docker_registry_url      = "https://${azurerm_container_registry.azurereactappneilacostaregistry.login_server}"
  docker_registry_username = azurerm_container_registry.azurereactappneilacostaregistry.admin_username
  docker_registry_password = azurerm_container_registry.azurereactappneilacostaregistry.admin_password
}
  #linux_fx_version = "DOCKER|${azurerm_container_registry.azurereactappneilacostaregistry.login_server}/neildockerimageappreact:latest"
  }
}
#Pulling the variables from terraform cloud into terraform build process
#variable "DOCKER_REGISTRY_SERVER_URL" {
# description = "URL for Azure Docker Registry Server"
#}

#variable "DOCKER_REGISTRY_SERVER_USERNAME" {
#  description = "Username for Azure Docker Registry Server"
#}

#variable "DOCKER_REGISTRY_SERVER_PASSWORD" {
#  description = "Password for Azure Docker Registry Server"
#}

#variable "DOCKER_CUSTOM_IMAGE_NAME" {
#  description = "Custom image route name inside Azure Container Registry"
#}



