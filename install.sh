source ./util/spinner.sh
source ./node/node.sh
source ./swarm/swarm.sh

read -p "Linode Token: " LINODE_TOKEN
LINODE_ROOT_PASSWORD=$(openssl rand -base64 32); echo Password for root: $LINODE_ROOT_PASSWORD
LINODE_REGION=eu-central

# create master node
create_node master01 & spinner "master01 "

# create worker node
create_node worker01 & spinner "worker01 "

# init swarm master
init_swarm_master master01 & spinner "swarm master01 "

# init swarm worker
init_swarm_worker master01 worker01 & spinner "swarm worker01 "