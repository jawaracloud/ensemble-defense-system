#!/bin/bash

sudo chmod go-w ./services/filebeat/filebeat.yml
sudo chmod -R go-w ./services/filebeat/modules.d
docker compose -f docker-compose.dvwa.yml up -d
docker compose -f docker-compose.yml --env-file .env up -d
