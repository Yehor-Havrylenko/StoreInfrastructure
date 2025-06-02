#!/bin/bash
apt-get update -y
apt-get install -y docker.io docker-compose git
systemctl start docker
systemctl enable docker

docker-compose up -d $(docker-compose config --services | grep -v '^frontend$')
