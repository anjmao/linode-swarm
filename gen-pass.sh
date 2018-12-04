#!/bin/bash

echo $(htpasswd -nb admin admin) | sed -e s/\\$/\\$\\$/g