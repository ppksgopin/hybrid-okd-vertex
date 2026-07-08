FROM python:3.13-slim

RUN mkdir /ansible
WORKDIR /ansible

RUN apt-get update && apt-get install -y bash openssh-client sshpass docker-cli curl && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip && pip install ansible

RUN ansible-galaxy collection install community.docker
RUN ansible-galaxy collection install community.libvirt

RUN curl -sL https://github.com/okd-project/okd/releases/download/4.15.0-0.okd-2024-03-10-010116/openshift-client-linux-4.15.0-0.okd-2024-03-10-010116.tar.gz | tar -xz -C /usr/local/bin/ oc kubectl && \
    curl -sL https://github.com/okd-project/okd/releases/download/4.15.0-0.okd-2024-03-10-010116/openshift-install-linux-4.15.0-0.okd-2024-03-10-010116.tar.gz | tar -xz -C /usr/local/bin/ openshift-install
