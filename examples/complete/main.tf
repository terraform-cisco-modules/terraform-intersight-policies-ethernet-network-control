module "ethernet_network_control_policy" {
  source  = "terraform-cisco-modules/policies-ethernet-network-control/intersight"
  version = ">= 1.0.1"

  cdp_enable   = true
  description  = "default Ethernet Network Control Policy."
  name         = "default"
  organization = "default"
}
