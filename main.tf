# This Terraform configuration file is designed to manage a Talos cluster on Proxmox. 
# It provides a structured approach to deploying and managing the cluster environment. 
# The configuration includes the Proxmox provider, local variables for Talos version, 
# and resources for downloading the Talos image and applying machine configurations 
# for control plane and worker nodes. By utilizing data blocks for retrieving machine 
# configurations, the configuration ensures that the correct settings are applied to 
# each node based on its role in the cluster. Additionally, the configuration includes 
# dependencies to ensure that resources are created in the correct order. Overall, this 
# Terraform configuration offers a modular and scalable solution for deploying and 
# managing a Talos cluster on Proxmox, providing a seamless experience for cluster 
# administrators.

provider "proxmox" {
  endpoint = "https://pve:8006/"
  username = "root@pam"
  password = var.proxmox_password # Use a secure method to manage sensitive data
  insecure = true                 # Only needed if your Proxmox server is using a self-signed certificate
}

#trying to get fluxcd working. You probably want to generate your ssh key for forgejo internally and then export the pub key to add to your forgejo, I had infra already setup so generated the key externally and just pointed it to it below.
provider "flux" {
  kubernetes = {
#    host                   = [var.talos_cp_01_ip_addr]
#    client_certificate     = taloscluster.taloscluster.client_certificate
#    client_key             = taloscluster.taloscluster.client_key
#    cluster_ca_certificate = taloscluster.talosccluster.cluster_ca_certificate
host                   = talos_cluster_kubeconfig.kubeconfig.kubernetes_client_configuration.host
client_certificate     = base64decode(talos_cluster_kubeconfig.kubeconfig.kubernetes_client_configuration.client_certificate)
client_key             = base64decode(talos_cluster_kubeconfig.kubeconfig.kubernetes_client_configuration.client_key)
cluster_ca_certificate = base64decode(talos_cluster_kubeconfig.kubeconfig.kubernetes_client_configuration.ca_certificate)
  }
  git = {
    url = "ssh://git@${var.forgejo_host}:${var.forgejo_port}/${var.forgejo_org}/${var.forgejo_repository}.git"
    ssh = {
      username    = "git"
      private_key = file("~/.ssh/id_ed25519")
    }
  }
}
#uncomment this and figure it out if you want to generate the forgejo instance internally and deploy to your cluster.
#provider "forgejo" {
#  host      = "http://${var.forgejo_host}:3000"
#  api_token = var.forgejo_token
#}
