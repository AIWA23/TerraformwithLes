provider "azurerm" {
  features {}
}
/*
terraform {
    backend "azurerm" {
        resource_group_name  = "tf_rg_blobstore"
        storage_account_name = "tfstoragebinarythistle"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}

variable "imagebuild" {
  type        = string
  description = "Latest Image Build"
}
*/


resource "azurerm_resource_group" "tf_ResourceGroup" {
  name = "Terraform"
  location = "East US"
}

resource "azurerm_container_group" "ContainerInstance" {
  name                      = "weatherapi"
  location                  = azurerm_resource_group.tf_ResourceGroup.location
  resource_group_name       = azurerm_resource_group.tf_ResourceGroup.name

  ip_address_type     = "public"
  dns_name_label      = "aiwa23"
  os_type             = "Linux"

  container {
      name            = "weatherapi"
      image           = "aiwa23/weatherapi"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        }
  }
}