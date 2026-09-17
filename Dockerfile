FROM python:3.13-slim

WORKDIR /ansible

# 增加 openssl
RUN apt-get update && apt-get install -y \
    bash openssh-client sshpass docker-cli curl vim apache2-utils openssl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -o /usr/local/bin/yq && chmod +x /usr/local/bin/yq

# 注入 newcert 模擬腳本
RUN printf '#!/usr/bin/env bash\nset -e\nopenssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "$1" 2>/dev/null\ncp tls.key oxcart.key && cp tls.crt oxcart.crt\necho "Generated tls.crt, tls.key, oxcart.crt, oxcart.key"\n' > /usr/local/bin/newcert \
    && chmod +x /usr/local/bin/newcert

RUN pip install --upgrade pip && \
    pip install ansible docker && \
    ansible-galaxy collection install community.docker && \
    ansible-galaxy collection install community.libvirt