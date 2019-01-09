#!/bin/bash

get_private_ip() {
    local name=$1
    docker-machine inspect  -f '{{.Driver.PrivateIPAddress}}' $name
}

init_swarm_master() {
    local name=$1
    local ip=$(get_private_ip $name)
    docker-machine ssh $name "docker swarm init --advertise-addr ${ip}"
}

init_swarm_worker() {
    local master_name=$1
    local worker_name=$2
    local master_addr=$(get_private_ip $master_name):2377
    local join_token=$(docker-machine ssh $master_name "docker swarm join-token worker -q")
    docker-machine ssh $worker_name "docker swarm join --token=${join_token} ${master_addr}"
}