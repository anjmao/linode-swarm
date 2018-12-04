source ./util/spinner.sh
source ./node/node.sh
source ./swarm/swarm.sh

LINODE_TOKEN=<TOKEN>
LINODE_ROOT_PASSWORD=$(openssl rand -base64 32); echo Password for root: $LINODE_ROOT_PASSWORD
LINODE_REGION=eu-central


# Install nodes
# install_worker worker01 & spinner "Installing worker01 "
# install_worker worker02 & spinner "Installing worker02"
# install_master master01 & spinner "Installing master master01"

init_swarm_master master01 192.168.155.118
init_swarm_worker master01 192.168.155.118:2377 worker01 192.168.146.150 & spinner "Init swarm worker "