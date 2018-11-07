#!/bin/sh

# Docker compose file cannot expand commands currently.
# We need to generate a docker-stack.yml for deployment.
# Run this script before "docker stack deploy".

export DOCKER_GWBRIDGE_IP=$(docker network inspect --format='{{range .IPAM.Config}}{{print .Gateway}}{{end}}' docker_gwbridge)
export PORT=9323

docker-compose -f docker-compose.yml config > docker-stack.yml