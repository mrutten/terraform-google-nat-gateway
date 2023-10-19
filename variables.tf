variable "project_id" {
  description = "The project ID to deploy to."
  type        = string
}

variable "region" {
  description = "The region to deploy to."
  type        = string
}

variable "icmp_idle_timeout_sec" {
  description = <<-EOF
    Timeout (in seconds) for ICMP connections. 
    Defaults to 30s if not set. Changing this forces a new NAT to be created.
  EOF
  type        = string
  default     = "30"
}

variable "min_ports_per_vm" {
  description = <<-EOF
    Minimum number of ports allocated to a VM from this NAT config. 
    Defaults to 64 if not set. Changing this forces a new NAT to be created.
  EOF
  type        = string
  default     = "64"
}

variable "max_ports_per_vm" {
  description = <<-EOF
    Maximum number of ports allocated to a VM from this NAT. 
    This field can only be set when enableDynamicPortAllocation is enabled. 
    This will be ignored if enable_dynamic_port_allocation is set to false.
  EOF
  type        = string
  default     = null
}

variable "nat_name" {
  description = "Changing this forces a new NAT to be created."
  type        = string
  default     = ""
}

variable "nat_ips" {
  description = <<-EOF
    List of self_links of external IPs. 
    Changing this forces a new NAT to be created. 
    Value of `nat_ip_allocate_option` is inferred based on nat_ips. 
    If present set to MANUAL_ONLY, otherwise AUTO_ONLY.
  EOF
  type        = list(string)
  default     = []
}

variable "network" {
  description = "VPC name, only if router is not passed in and is created by the module."
  type        = string
  default     = ""
}

variable "create_router" {
  description = "Create router instead of using an existing one, uses 'router' variable for new resource name."
  type        = bool
  default     = false
}

variable "router_name" {
  description = <<-EOF
    The name of the router in which this NAT will be configured. 
    Changing this forces a new NAT to be created.
  EOF
  type        = string
}

variable "router_asn" {
  description = "Router ASN, only if router is not passed in and is created by the module."
  type        = string
  default     = "64514"
}

variable "router_keepalive_interval" {
  description = "Router keepalive_interval, only if router is not passed in and is created by the module."
  type        = string
  default     = "20"
}

variable "source_subnetwork_ip_ranges_to_nat" {
  description = <<-EOF
    Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES. How NAT should be configured per Subnetwork. 
    Valid values include: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS. 
    Changing this forces a new NAT to be created.
  EOF
  type        = string
  default     = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

variable "tcp_established_idle_timeout_sec" {
  description = <<-EOF
    Timeout (in seconds) for TCP established connections. 
    Defaults to 1200s if not set. Changing this forces a new NAT to be created.
  EOF
  type        = string
  default     = "1200"
}

variable "tcp_transitory_idle_timeout_sec" {
  description = <<-EOF
    Timeout (in seconds) for TCP transitory connections. 
    Defaults to 30s if not set. Changing this forces a new NAT to be created.
  EOF
  type        = string
  default     = "30"
}

variable "tcp_time_wait_timeout_sec" {
  description = "Timeout (in seconds) for TCP connections that are in TIME_WAIT state."
  type        = string
  default     = "120"
}

variable "udp_idle_timeout_sec" {
  description = "Timeout (in seconds) for UDP connections. Changing this forces a new NAT to be created."
  type        = string
  default     = "30"
}

variable "subnetworks" {
  description = "Specifies one or more subnetwork NAT configurations."
  type = list(object({
    name                     = string,
    source_ip_ranges_to_nat  = list(string)
    secondary_ip_range_names = list(string)
  }))
  default = []
}

variable "log_config_enable" {
  description = "Indicates whether or not to export logs."
  type        = bool
  default     = false
}

variable "log_config_filter" {
  description = "Specifies the desired filtering of logs on this NAT. Valid values are: \"ERRORS_ONLY\", \"TRANSLATIONS_ONLY\", \"ALL\"."
  type        = string
  default     = "ALL"
}

variable "enable_dynamic_port_allocation" {
  description = <<-EOF
    Enable Dynamic Port Allocation. 
    If minPorts is set, minPortsPerVm must be set to a power of two greater than or equal to 32.
  EOF
  type        = bool
  default     = false

}
variable "enable_endpoint_independent_mapping" {
  description = "Specifies if endpoint independent mapping is enabled."
  type        = bool
  default     = null
}
