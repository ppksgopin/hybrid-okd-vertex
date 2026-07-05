FROM python:3.13-slim

RUN mkdir /ansible
WORKDIR /ansible

RUN apt-get update && apt-get install -y bash openssh-client sshpass docker-cli && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip && pip install ansible

RUN ansible-galaxy collection install community.docker
