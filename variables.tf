# This file defines the variables used in the Terraform configuration.

variable "cluster_name" {
  type    = string
  default = "kubernetes_cluster"
}

variable "default_gateway" {
  type    = string
  default = "10.0.0.1"
}

variable "talos_cp_01_ip_addr" {
  type    = string
  default = "10.0.0.70"
}

variable "talos_cp_02_ip_addr" {
  type    = string
  default = "10.0.0.71"
}

variable "talos_cp_03_ip_addr" {
  type    = string
  default = "10.0.0.72"
}

variable "talos_worker_01_ip_addr" {
  type    = string
  default = "10.0.0.73"
}

variable "talos_worker_02_ip_addr" {
  type    = string
  default = "10.0.0.74"
}

variable "talos_worker_03_ip_addr" {
  type    = string
  default = "10.0.0.75"
}

variable "proxmox_password" {
  type        = string
  sensitive   = true
  description = "Password for Proxmox API access"
}

variable "cp_vip" {
  type    = string
  default = "192.168.3.180"
}

variable "talos_version" {
  type    = string
  default = "v1.9.5"
}

variable "kubernetes_version" {
  type    = string
  default = "1.32.0"
}
#for fluxcd
variable "forgejo_host" {
  description = "Forgejo hostname"
  type        = string
  default     = "PUTFORGEJOIPHEHERE"
}

variable "forgejo_port" {
  description = "Forgejo port"
  type        = number
  default     = 23
}

variable "forgejo_org" {
  description = "Forgejo organization"
  type        = string
  default     = "PUTORGNAMEHERE"
}

variable "forgejo_repository" {
  description = "Forgejo repository"
  type        = string
  default     = "talosflux"
}
variable "forgejo_path" {
  description = "Forgejo path"
  type        = string
  default     = "cluster/prod"
}
#uncomment below and change the default token to whatever you need to support creation of your own forgejo repo for this installation if that's what you want.
#variable "forgejo_token" {
#  description = "Forgejo api token"
#  type        = string
#  default     = "default token"
#}
