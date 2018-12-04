#!/bin/bash

install_master() {
    name=$1
    docker-machine create \
    -d linode \
    --linode-label=$name \
    --linode-instance-type=g6-nanode-1 \
    --linode-image=linode/ubuntu18.04 \
    --linode-region=$LINODE_REGION \
    --linode-token=$LINODE_TOKEN \
    --linode-root-pass=$LINODE_ROOT_PASSWORD \
    $name
}

install_worker() {
    name=$1
    docker-machine create \
    -d linode \
    --linode-label=$name \
    --linode-instance-type=g6-nanode-1 \
    --linode-image=linode/ubuntu18.04 \
    --linode-region=$LINODE_REGION \
    --linode-token=$LINODE_TOKEN \
    --linode-root-pass=$LINODE_ROOT_PASSWORD \
    $name
}
