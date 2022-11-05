#useterrafromprovider
terraform {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "3.29.1"
      }
    }
  }

#프로바이더지정및구독아이디   
provider "azurerm" {
  subscription_id = "bfa5d97b-bcb7-4de5-844e-74c2758afdd2"
  features {}
}


locals {
  resource_group="hwi-grp"
  location="koreacentral"  
}

#리소스그룹지정하기
resource "azurerm_resource_group" "hwi_grp" {
    name = "hwi_grp"
    location = "koreacentral"
  }

#container in the storage account 생성
resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = "terraformstore221105"
  container_access_type = "private"
}

# This is used to upload a local file onto the container
resource "azurerm_storage_blob" "sample" {
  name                   = "sample"
  storage_account_name   = "hwicontainer123"
  storage_container_name = "data"
  type                   = "Block"
}


# allow_blob_public_access를 설정 (false > public access disabled)
resource "azurerm_storage_account" "storage_account" {
  name                     = "terraformstore221105"
  resource_group_name      = "hwi-grp"
  location                 = "koreacentral"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false
}