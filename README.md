# Docker-Swarm-Prometheus
---
This is a fully dockerized Prometheus monitoring configuration on Docker Swarm. You can use minimal steps to deploy Prometheus and all the other required components on your Docker Swarm to monitor the swarm itself.  

## Prerequisite
1. A working Docker Swarm hosted on Linux (Docker for Mac / Windows is not supported)  

If you have not create a Docker Swarm yet, please follow [official guide here](https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/) to create one. Yes... There is only one prerequisite.  

## Installation
Before start, please check if the following command outputs correctly.
```
docker network inspect --format='{{range .IPAM.Config}}{{.Gateway}}{{end}}' docker_gwbridge
```
It should output an IP address. By default, it is 172.18.0.1.    

Then run the followings.  
```
git clone https://github.com/fortesit/Docker-Swarm-Prometheus.git
cd Docker-Swarm-Prometheus/
chmod +x *.sh
./generate_deploy_config.sh
./expose_docker_metrics.sh
```

You are asked whether to restart Docker Engine. You need to restart Docker Engine to complete installation.  

## Usage
On the repository directory, run the following to deploy Prometheus and all the other required components.
```
docker stack deploy -c docker-stack.yml monitoring
```
You can then access Prometheus on http://{SWARM_IP}:9090 and Grafana on http://{SWARM_IP}:3000 .
