#!/bin/bash

init_swarm_master() {
    name=$1
    ip=$2
    docker-machine ssh $name "docker swarm init \
    --advertise-addr ${ip}"
}

init_swarm_worker() {
    master_name=$1
    master_addr=$2
    worker_name=$3
    worker_ip=$4
    join_token=$(docker-machine ssh $master_name "docker swarm \join-token worker -q")
    docker-machine ssh $worker_name "docker swarm join \
    --token=${join_token} \
    ${master_addr}"
}