# Kubernetes IAC

Terraform Kubernetes Infrastructure as Code (IAC)

This repository was created by following the instructions in the article linked below, with modifications to suit my specific cluster configuration. Note that the datasets or datastores on my Proxmox setup may differ from yours, so adjust accordingly. My Proxmox cluster consists of three nodes and uses Ceph for efficient virtual machine management across all nodes.

**Article**: [Talos Cluster on Proxmox with Terraform](https://olav.ninja/talos-cluster-on-proxmox-with-terraform) by Olav

---

## Additional Steps

After setting up the cluster, you may find the following steps helpful.

### Connect to the Talos Kubernetes Cluster

To connect to your Talos Kubernetes cluster using Terraform outputs, configure your local environment as follows:

1. Save the `kubeconfig` and `talosconfig` outputs to files on your local machine:
	```bash
	terraform output -raw kubeconfig > ~/.kube/config
	terraform output -raw talosconfig > ~/.talos/config
	```

2. Set appropriate file permissions to avoid security issues:
	```bash
	chmod 600 ~/.kube/config ~/.talos/config
	```

### Set Up `kubectl`

To interact with the Kubernetes cluster, use `kubectl`. For example, to list the nodes:
```bash
kubectl get nodes
```

Sample output:
```
NAME              STATUS   ROLES           AGE   VERSION
talos-cp-01       Ready    control-plane   83s   v1.32.0
talos-cp-02       Ready    control-plane   86s   v1.32.0
talos-cp-03       Ready    control-plane   85s   v1.32.0
talos-worker-01   Ready    <none>          88s   v1.32.0
talos-worker-02   Ready    <none>          86s   v1.32.0
talos-worker-03   Ready    <none>          90s   v1.32.0
```

### Use `talosctl`

- **View the Dashboard**:
  ```bash
  talosctl dashboard -n talos-cp-01
  ```

- **Check Cluster Health**:
  ```bash
  talosctl -n talos-cp-01 health
  ```
  Sample output:
  ```
  discovered nodes: ["10.0.0.73" "10.0.0.74" "10.0.0.75" "10.0.0.70" "10.0.0.71" "10.0.0.72"]
  waiting for etcd to be healthy: OK
  waiting for all k8s nodes to report ready: OK
  waiting for all control plane components to be ready: OK
  ...
  ```

- **Health Dashboard Example**:
  ![Talosctl Dashboard](photos/talosctl_dashboard.png)

### Reset the Cluster

If you need to start over, you can taint resources and reapply the Terraform configuration:
```bash
terraform state list | xargs -n1 terraform taint
terraform apply
```

---

Adjust paths and configurations as needed for your environment.
