#!/bin/bash

set -e

echo "Updating system..."
sudo apt update -y

echo "Installing Docker..."
sudo apt install -y docker.io docker-compose

sudo systemctl enable docker
sudo systemctl start docker

echo "Building and starting services..."
sudo docker-compose up -d --build

echo "Deployment completed!"
echo "Access:"
echo "http://<your-ip>/app"
echo "http://<your-ip>/legacy"
