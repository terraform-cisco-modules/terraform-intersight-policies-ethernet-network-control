<!-- BEGIN_TF_DOCS -->
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Developed by: Cisco](https://img.shields.io/badge/Developed%20by-Cisco-blue)](https://developer.cisco.com)
[![Tests](https://github.com/terraform-cisco-modules/terraform-intersight-policies-ethernet-network-control/actions/workflows/terratest.yml/badge.svg)](https://github.com/terraform-cisco-modules/terraform-intersight-policies-ethernet-network-control/actions/workflows/terratest.yml)

# Terraform Intersight Policies - Ethernet Network Control
Manages Intersight Ethernet Network Control Policies

Location in GUI:
`Policies` » `Create Policy` » `Ethernet Network Control`

## Easy IMM

[*Easy IMM - Comprehensive Example*](https://github.com/terraform-cisco-modules/easy-imm-comprehensive-example) - A comprehensive example for policies, pools, and profiles.

## Example

### main.tf
```hcl
module "ethernet_network_control_policy" {
  source  = "terraform-cisco-modules/policies-ethernet-network-control/intersight"
  version = ">= 1.0.1"

  cdp_enable   = true
  description  = "default Ethernet Network Control Policy."
  name         = "default"
  organization = "default"
}
```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = fileexists(var.secretkeyfile) ? file(var.secretkeyfile) : var.secretkey
}
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  default     = ""
  description = "Intersight Secret Key Content."
  sensitive   = true
  type        = string
}

variable "secretkeyfile" {
  default     = "blah.txt"
  description = "Intersight Secret Key File Location."
  sensitive   = true
  type        = string
}
```

## Environment Variables

### Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with the value of [your-api-key]
- Add variable secretkey with the value of [your-secret-file-content]

### Linux and Windows
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkeyfile="<secret-key-file-location>"
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.32 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.32 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_action_on_uplink_fail"></a> [action\_on\_uplink\_fail](#input\_action\_on\_uplink\_fail) | Determines the state of the virtual interface (vethernet / vfc) on the switch when a suitable uplink is not pinned.  Options are:<br>* linkDown<br>* warning<br>Important! If the Action on Uplink is set to Warning, the switch will not fail over if uplink connectivity is lost. | `string` | `"linkDown"` | no |
| <a name="input_cdp_enable"></a> [cdp\_enable](#input\_cdp\_enable) | Flag to Enable or Disable CDP on an interface. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the Policy. | `string` | `""` | no |
| <a name="input_lldp_enable_receive"></a> [lldp\_enable\_receive](#input\_lldp\_enable\_receive) | Determines if the LLDP frames can be received by an interface on the switch. | `bool` | `false` | no |
| <a name="input_lldp_enable_transmit"></a> [lldp\_enable\_transmit](#input\_lldp\_enable\_transmit) | Determines if the LLDP frames can be transmitted by an interface on the switch. | `bool` | `false` | no |
| <a name="input_mac_register_mode"></a> [mac\_register\_mode](#input\_mac\_register\_mode) | Determines the MAC addresses that have to be registered with the switch.  Options are:<br>* allVlans<br>* nativeVlanOnly | `string` | `"nativeVlanOnly"` | no |
| <a name="input_mac_security_forge"></a> [mac\_security\_forge](#input\_mac\_security\_forge) | Determines if the MAC forging is allowed or denied on an interface.  Options are:<br>* allow<br>* deny | `string` | `"allow"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the Policy. | `string` | `"default"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"default"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag Attributes to Assign to the Policy. | `list(map(string))` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | Ethernet Network Control Policy Managed Object ID (moid). |
## Resources

| Name | Type |
|------|------|
| [intersight_fabric_eth_network_control_policy.ethernet_network_control](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_eth_network_control_policy) | resource |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
<!-- END_TF_DOCS -->