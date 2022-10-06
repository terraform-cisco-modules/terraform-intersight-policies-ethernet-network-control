terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

# Setup provider, variables and outputs
provider "intersight" {
  apikey    = var.intersight_keyid
  secretkey = file(var.intersight_secretkeyfile)
  endpoint  = var.intersight_endpoint
}

variable "intersight_keyid" {}
variable "intersight_secretkeyfile" {}
variable "intersight_endpoint" {
  default = "intersight.com"
}
variable "name" {}

output "moid" {
  value = module.main.moid
}

# This is the module under test
module "main" {
  source                = "../.."
  action_on_uplink_fail = "linkDown"
  description           = "${var.name} Ethernet Network Control Policy."
  cdp_enable            = true
  lldp_enable_receive   = true
  lldp_enable_transmit  = true
  mac_register_mode     = "nativeVlanOnly"
  mac_security_forge    = "allow"
  name                  = var.name
  organization          = "terratest"
}
