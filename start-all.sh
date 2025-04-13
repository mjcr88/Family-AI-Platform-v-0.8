#!/bin/bash

echo "Starting Outline Docker Compose services..."
docker-compose -f outline-docker-compose/docker-compose.yml up -d

echo "Starting Outline services..."
docker-compose -f outline/docker-compose.yml up -d

echo "Starting Dev Tools (n8n and WebUI)..."
docker-compose -f dev-tools/docker-compose.yml up -d

echo "Starting Platform Core Services..."
docker-compose -f platform/docker-compose.core.yml up -d

echo "All services started successfully!"