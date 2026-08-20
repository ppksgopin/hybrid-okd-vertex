#!/bin/bash

docker build -t ansible-infra-img:latest . --no-cache
docker run -it -d --name ansible-infra --network host -v $(pwd):/ansible -v ~/.ssh:/root/.ssh:ro ansible-infra-img:latest
docker image prune -af
docker exec -it ansible-infra /bin/bash
