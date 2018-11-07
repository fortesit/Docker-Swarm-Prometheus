#!/bin/sh

# Run this script to expose Docker Engine metrics.

cat << EOF > /etc/docker/daemon.json
{
  "metrics-addr" : "0.0.0.0:9323",
  "experimental" : true
}
EOF

docker ps

echo "Metrics expose configuration completed! Docker Engine needed to be restarted for activation.
[CAUTION!] All running containers shown above will be removed. You need to restart them manually after Docker Engine restarted."

read -p "Do you want to restart Docker Engine now? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

systemctl restart docker.service

echo "Docker Engine restart completed."