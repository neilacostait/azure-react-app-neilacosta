##resource "azurerm_resource_group" "react-app-resource2" {
##  name     = "react-app-resource2"
##  location = "East US"
##}
##
##resource "azurerm_service_plan" "react-app-resource2-service_plan_id" {
##  name                = "react-app-resource2-service_plan_id"
##  resource_group_name = azurerm_resource_group.react-app-resource2.name
##  location            = azurerm_resource_group.react-app-resource2.location
##  os_type             = "Linux"
##  sku_name            = "B1"
##}
##
##resource "azurerm_linux_web_app" "neilacosta-web-react-app-tf" {
##  name                = "neilacosta-web-react-app-tf"
##  resource_group_name = azurerm_resource_group.react-app-resource2.name
##  location            = azurerm_service_plan.react-app-resource2-service_plan_id.location
##  service_plan_id     = azurerm_service_plan.react-app-resource2-service_plan_id.id
##
##  app_settings = {
##    DOCKER_REGISTRY_SERVER_URL      = var.DOCKER_REGISTRY_SERVER_URL
##    DOCKER_REGISTRY_SERVER_USERNAME = var.DOCKER_REGISTRY_SERVER_USERNAME
##    DOCKER_REGISTRY_SERVER_PASSWORD = var.DOCKER_REGISTRY_SERVER_PASSWORD
##    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
##    WEBSITES_PORT = "3000"
##    DOCKER_CUSTOM_IMAGE_NAME    = var.DOCKER_CUSTOM_IMAGE_NAME
##  }
##
##  site_config {
##    always_on        = true
##    }
##    }
##
###Pulling the variables from terraform cloud into terraform build process
##variable "DOCKER_REGISTRY_SERVER_URL" {
## description = "URL for Azure Docker Registry Server"
##}
##
##variable "DOCKER_REGISTRY_SERVER_USERNAME" {
##  description = "Username for Azure Docker Registry Server"
##}
##
##variable "DOCKER_REGISTRY_SERVER_PASSWORD" {
##  description = "Password for Azure Docker Registry Server"
##}
##
##variable "DOCKER_CUSTOM_IMAGE_NAME" {
##  description = "Custom image route name inside Azure Container Registry"
##}
##
##
##
##