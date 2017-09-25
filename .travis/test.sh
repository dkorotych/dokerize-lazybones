#!/usr/bin/env bash

set -e
set -u

function lazybones() {
    mounts=""
    for volume in "${HOME}/.lazybones" "${HOME}/.groovy" "${HOME}/.m2"
    do
        if [ ! -d "$volume" ]; then
            mkdir -p ${volume}
        fi
        mounts="${mounts} --volume $volume:$volume"
    done
    docker run \
        --rm \
        --tmpfs /tmp \
        --volume /etc/group:/etc/group:ro \
        --volume /etc/passwd:/etc/passwd:ro \
        --user "$(id -u):$(id -g)" \
        --volume "${PWD}":/app \
        ${mounts} \
    ${IMAGE_NAME} $@
}

lazybones config add bintrayRepositories dkorotych/lazybones-templates
mkdir tmp
cd tmp
lazybones create maven-quickstart .

stat -c "%U" ~/.lazybones/managed-config.json | grep "$(whoami)"
stat -c "%U" ~/.lazybones/templates  | grep "$(whoami)"
stat -c "%U" ~/.groovy/grapes/uk.co.cacoethes/ | grep "$(whoami)"
