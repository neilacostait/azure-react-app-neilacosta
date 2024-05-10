terraform {
    backend "remote" {
      hostname = "app.terraform.io"
      organization = "neilacostait"
      workspaces {
            namename = "azure-react-app-neilacosta"
      }
    }       
    required_providers {
        azurerm = {
                source  = "hashicorp/azurerm"
        }
        local = {
        source = "hashicorp/local"
        }
    }
}
provider "azurerm" {
features {} // Empty features block
}

#This variables are defined in Terraform Cloud:
#  subscription_id = var.ARM_SUBSCRIPTION_ID
#  tenant_id       = var.ARM_TENANT_ID
#  client_id       = var.ARM_CLIENT_ID
#  client_secret   = var.ARM_CLIENT_SECRET
