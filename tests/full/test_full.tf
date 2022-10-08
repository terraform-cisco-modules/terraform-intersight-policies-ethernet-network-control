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
