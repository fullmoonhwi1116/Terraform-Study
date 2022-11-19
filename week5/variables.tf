#변수 파일이며 리소스에 대한 기본값

variable "vnet_name" {
  type    = string
  default = "hwi_vnet"
}

variable "rg_name" {
  type    = string
  default = "hwiyoung"
}

variable "location" {
  type    = string
  default = "koreacentral"
}

variable "address_space" {
  type    = list(any)
  default = ["10.0.0.0/16"]
}

variable "subnet" {
  description = "Map of Azure VNET subnet configuration"
  type        = map(any)
  default = {
    app_subnet = {
      name                 = "app_subnet"
      resource_group_name  = "hwiyoung"
      virtual_network_name = "hwi_vnet"
      address_prefixes     = ["10.0.1.0/24"]
    },
    db_subnet = {
      name                 = "db_subnet"
      resource_group_name  = "hwiyoung"
      virtual_network_name = "hwi_vnet"
      address_prefixes     = ["10.0.2.0/24"]
    }
  }
}