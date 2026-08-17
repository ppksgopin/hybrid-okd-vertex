FROM python:3.13-slim

RUN mkdir /ansible
WORKDIR /ansible

RUN apt-get update && apt-get install -y bash openssh-client sshpass docker-cli curl vim && rm -rf /var/lib/apt/lists/*
RUN curl -sSL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -o /usr/local/bin/yq && chmod +x /usr/local/bin/yq

RUN pip install --upgrade pip && pip install ansible

RUN ansible-galaxy collection install community.docker
RUN ansible-galaxy collection install community.libvirt
