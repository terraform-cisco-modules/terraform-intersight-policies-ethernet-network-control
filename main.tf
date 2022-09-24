#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}

#__________________________________________________________________
#
# Intersight Ethernet Network Control Policy
# GUI Location: Policies > Create Policy > Ethernet Network Control
#__________________________________________________________________

resource "intersight_fabric_eth_network_control_policy" "vnic_control" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  cdp_enabled           = var.cdp_enable
  description           = var.description != "" ? var.description : "${var.name} Ethernet Network Control Policy."
  forge_mac             = var.mac_security_forge
  mac_registration_mode = var.mac_register_mode
  name                  = var.name
  uplink_fail_action    = var.action_on_uplink_fail
  lldp_settings {
    object_type      = "fabric.LldpSettings"
    receive_enabled  = var.lldp_enable_receive
    transmit_enabled = var.lldp_enable_transmit
  }
  organization {
    moid        = data.intersight_organization_organization.org_moid.results[0].moid
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}