<h1 align="center">
    Kubernetes Cluster with Ansible
</h1>

<p align="center">
    Automate the provisioning of a bare-metal multi-node Kubernetes cluster with Ansible.
    Uses all the industry-standard tools for an enterprise-grade cluster.
    Overview on how this cluster can be used for embeddings using GPU Nodes.
</p>

## Table of Contents

- **[Stack](#stack)**
- **[Requirements](#requirements)**
- **[Usage](#usage)**
- **[GPU](#gpu-powered)**

## Stack
- **Ubuntu**: Tested with Ubuntu 22.04
- **Ansible**: an open source IT automation engine.
- **ContainerD**: an industry-standard container runtime.
- **Kubernetes**: an open-source system for automating deployment, scaling, and management of containerized applications.
- **Calico**: an open source networking and network security solution for containers (CNI).
- **MetalLB**: a bare metal load-balancer for Kubernetes.
- **Nginx**: an Ingress controller.
- **Cert-Manager**: adds certificates and certificate issuers as resource types in Kubernetes cluster.

## Requirements

1. A Linux machine with a superuser privileges and pre-installed Ansible.
```
$ run sh ./setup-user-ansible.sh 
```
2. Ubuntu machines that are intended to become part of the new Kubernetes cluster.
   Make sure that your SSH key is already installed on the machines by running the following command:
```
$ ssh-copy-id <The remote username>@<The IPv4 address of the remote machine>
  run sh ./setup-user-ansible.sh
```

## Usage

1. Clone this Git repository to your local working station:
```
$ git clone https://github.com/vijyantg/kubeadm-cluster-with-ansible.git
```

2. Change directory to the root directory of the project:
```
$ cd kubeadm-cluster-with-ansible
```

3. Edit the values of the default variables to your requirements:
```
$ vi defaults/main.yaml
```

4. Edit the Ansible inventory file to your requirements:
```
$ vi inventory/hosts.ini
```

5. Run the Ansible Playbook:
```
$ ansible-playbook -i inventory/hosts.ini -K playbooks/cluster.yaml
```
## GPU Powered

1. Preparing for GPU Workload Deployment
To deploy GPU workloads on a Kubernetes cluster, you need to set up the nodes to recognize and utilize GPU resources effectively. This [GPU installation](https://docs.deep-hybrid-datacloud.eu/en/latest/technical/kubernetes/gpu-kubernetes-ubuntu.html) outlines the steps to install GPU drivers and necessary tools ensuring your Kubernetes cluster is prepared for GPU-based workloads.

2. Scaling Considerations:
Use Kubernetes' Horizontal Pod Autoscaler to scale the deployment based on CPU/GPU utilization.
Ensure that the cluster has enough GPU nodes to handle scaling efficiently.

3. Performance Optimization:
Optimize containers for GPU usage by fine-tuning the code and selecting appropriate libraries that utilize GPU acceleration.
Consider deploying a GPU monitoring stack (e.g., Prometheus and Grafana) to visualize and optimize GPU performance in real-time.
