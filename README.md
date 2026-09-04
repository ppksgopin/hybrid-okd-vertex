# Hybrid OKD (OpenShift) Cluster Deployment via Ansible

A fully automated, modular Infrastructure as Code (IaC) pipeline designed to provision, bootstrap, and maintain an OKD (OpenShift Community Distribution) cluster on bare-metal/virtualized environments.

## 📌 Architecture Overview
* **Control Plane & Workers**: Multi-node high-availability orchestration.
* **Automation Engine**: Parameter-driven Ansible Playbooks managing end-to-end host preparation, Ignition generation, and node bootstrapping.
* **Networking & Ingress**: Dedicated HAProxy load balancing, DNS resolution, and Day-2 ingress controller patching.

## 🚀 Key Features
* **Automated Node Provisioning**: Pre-configured environment bootstrapping using Ansible, eliminating manual configuration drift.
* **Day-2 Configuration Management**: Modular tasks for post-installation maintenance, operator configuration, and persistent volume integration.
* **Containerized Execution**: Standalone container deployment (`Dockerfile`, `start.sh`) for isolated, cross-platform playbook execution.

## 🛠 Tech Stack
* **Orchestration**: OKD / OpenShift Container Platform
* **Automation & IaC**: Ansible, Bash
* **OS & Runtime**: Fedora CoreOS / Enterprise Linux, Docker
* **Networking**: HAProxy, DNS / Keepalived
