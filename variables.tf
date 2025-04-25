# This file defines the variables used in the Terraform configuration.

variable "talos_nodes" {
  type = map(object({
    description : string
    tags        : list(string)
    node_name   : string
    on_boot     : bool
    cores       : number
    memory      : number
    ip_addr     : string
  }))
  default = {
    talos_cp_01 = {
      description = "Managed by Terraform"
      tags        = ["terraform"]
      node_name   = "pve"
      on_boot     = true
      cores       = 2
      memory      = 4096
      ip_addr     = "10.0.0.70"
    }
    talos_cp_02 = {
      description = "Managed by Terraform"
      tags        = ["terraform"]
      node_name   = "pve2"
      on_boot     = true
      cores       = 2
      memory      = 4096
      ip_addr     = "10.0.0.71"
    }
    talos_cp_03 = {
      description = "Managed by Terraform"
      tags        = ["terraform"]
      node_name   = "pve3"
      on_boot     = true
      cores       = 2
      memory      = 4096
      ip_addr     = "10.0.0.72"
    }
    talos_worker_01 = {
      description = "Managed by Terraform"
      tags        = ["terraform"]
      node_name   = "pve4"
      on_boot     = true
      cores       = 2
      memory      = 4096
      ip_addr     = "10.0.0.73"
    }
    talos_worker_02 = {
      description = "Managed by Terraform"
      tags        = ["terraform"]
      node_name   = "pve5"
      on_boot     = true
      cores       = 2
      memory      = 4096
      ip_addr     = "10.0.0.74"
    }
    talos_worker_03 = {
      description = "Managed by Terraform"
      tags        = ["terraform"]
      node_name   = "pve6"
      on_boot     = true
      cores       = 2
      memory      = 4096
      ip_addr     = "10.0.0.75"
    }
  }
}

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
