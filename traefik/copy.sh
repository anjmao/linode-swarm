#!/bin/bash

# copy current dir into master docker machine under traefik folder
MACHINE_NAME=master01
docker-machine ssh ${MACHINE_NAME} "rm -rf /traefik"
docker-machine scp -r ${PWD} ${MACHINE_NAME}:/traefik