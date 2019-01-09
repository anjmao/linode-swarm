#!/bin/bash
docker network create --driver overlay traefik
docker stack deploy -c traefik-stack.yaml traefik