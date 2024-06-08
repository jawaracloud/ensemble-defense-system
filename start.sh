#!/bin/bash

docker compose -f docker-compose.dvwa.yml restart -d
docker compose -f docker-compose.yml --env-file .env restart -d
