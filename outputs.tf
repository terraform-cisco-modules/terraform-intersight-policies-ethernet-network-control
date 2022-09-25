#________________________________________________________________
#
# Collect the moid of the Ethernet Network Control Policy
#________________________________________________________________

output "moid" {
  description = "Ethernet Network Control Policy Managed Object ID (moid)."
  value       = intersight_fabric_eth_network_control_policy.ethernet_network_control.moid
}
