#!/bin/bash

create_node() {
    local name=$1
    docker-machine create \
    -d linode \
    --linode-label=$name \
    --linode-instance-type=g6-nanode-1 \
    --linode-image=linode/ubuntu18.04 \
    --linode-region=$LINODE_REGION \
    --linode-token=$LINODE_TOKEN \
    --linode-root-pass=$LINODE_ROOT_PASSWORD \
    --linode-create-private-ip \
    --tls-san 127.0.0.1 \
    --tls-san $HOST_NAME \
    $name
}
