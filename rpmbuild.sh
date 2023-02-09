#!/bin/bash

if ! command -v docker-compose > /dev/null; then
    echo "Error: Docker is not installed. Please install Docker and try again."
    exit 1
fi

# Ensure he present working directory (PWD)
# is the same location as the bash script
cd "$(dirname "$(readlink -f "$0")")"

if [ ! -d "rpms" ]; then
    mkdir rpms
fi

docker-compose up
