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

  app_settings = {
    DOCKER_REGISTRY_SERVER_URL      = var.DOCKER_REGISTRY_SERVER_URL
    DOCKER_REGISTRY_SERVER_USERNAME = var.DOCKER_REGISTRY_SERVER_USERNAME
    DOCKER_REGISTRY_SERVER_PASSWORD = var.DOCKER_REGISTRY_SERVER_PASSWORD
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
  }

  site_config {
    always_on        = true
    app_command_line = ""
    application_stack {
       docker_image_name = "azurereactappneilacosta/neilacostareactweb:latest"
    }
    }
}

#Pulling the variables from terraform cloud into terraform build
variable "DOCKER_REGISTRY_SERVER_URL" {
  type        = string
  description = "URL for Azure Docker Registry Server"
}

variable "DOCKER_REGISTRY_SERVER_USERNAME" {
  type        = string
  description = "Username for Azure Docker Registry Server"
}

variable "DOCKER_REGISTRY_SERVER_PASSWORD" {
  type        = string
  description = "Password for Azure Docker Registry Server"
}