<h1 align="center">
    Kubernetes Cluster with Ansible
</h1>

<p align="center">
    Automate the provisioning of a bare-metal multi-node Kubernetes cluster with Ansible.
    Uses all the industry-standard tools for an enterprise-grade cluster.
</p>

## Table of Contents

- **[Stack](#stack)**
- **[Requirements](#requirements)**
- **[Usage](#usage)**

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
