# Linode Docker Swarm

Provision docker swarm cluster on linode in a few simple steps.

## Features

- [x] Automatically create VM for master and worker using docker machine.
- [x] Automatically create docker swarm using private networking.
- [ ] Optional traefik setup

## Usage

```shell
git clone git@github.com:anjmao/linode-swarm.git
./install.sh
```

## Traefik deployment

Before deployment

1. Replace Host in traefik-stack.yaml
2. Replace Lets Encrypt email in traefik.toml
3. Generate more secure password for traefik dashboard and put it in traefik.toml

To deploy

```shell
cd traefik
./copy.sh
docher-machine ssh master01
cd /traefik
./install.sh
```

## Dependencies

1. docker
2. docker-machine
