#!/bin/bash

set -e

docker build -t mydns .
docker run -d --rm --name=mydns -p 8053:53/udp -p 8053:53/tcp mydns
