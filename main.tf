terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id=var.subscription_id
  client_secret=var.client_secret
  tenant_id=var.tenant_id
  client_id=var.client_id
  features {}
}



module "vnet" {
  source  = "app.terraform.io/example-org-15045d/vnet/azurerm"
  version = "1.0.0"

  vnet = {
    enabled             = true
    name                = "test"
    location            = "Korea South"
    resource_group_name = "sample-labs"
    address_space       = ["10.0.0.0/16"]
    
    subnets = [
        {
        name             = "subnet1"
        address_prefixes = ["10.0.1.0/24"]
        },
        {
        name             = "subnet2"
        address_prefixes = ["10.0.2.0/24"]
        }
    ]
    tags = {
    "Project" = "MyProject"
  }
  }
  
  
}