# This file defines the required providers for the Terraform configuration.
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.74.1"
    }
    talos = {
      source  = "siderolabs/talos"
      version = "0.7.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
    flux = {
      source = "fluxcd/flux"
      version = "1.5.1"
    }
#uncomment this and figure it out if you want to deploy forgejo as part of this terraforma nd deploy flux from it.
#    forgejo = {
#      source  = "svalabs/forgejo"
#      version = ">= 0.2.3"
#    }
  }
}
