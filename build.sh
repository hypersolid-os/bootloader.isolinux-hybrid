#!/usr/bin/env bash

set -e

# basedir
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORKINGDIR="$(pwd)"
CONTAINER_NAME="bootloader-isolinux"

# create environment
docker build \
    -t ${CONTAINER_NAME} \
    . \
&& {
    echo "build environment ready"
} || {
    echo "cannot create build environment"
    exit 1
}

# container already exists ?
docker container rm ${CONTAINER_NAME}-env && {
    echo "existing build environment removed"
} || {
    echo "cannot remove build environment"
}

# create image
docker run \
    --privileged=true \
    --volume /dev:/dev \
    --name ${CONTAINER_NAME}-env \
    --mount type=bind,source="$(pwd)"/system,target=/mnt/system \
    --mount type=bind,source="$(pwd)"/conf,target=/mnt/conf \
    --mount type=bind,source="$(pwd)"/dist,target=/mnt/dist \
    --tty \
    --interactive \
    ${CONTAINER_NAME} \
&& {
    echo "image created"
} || {
    echo "ERROR: image creation failed"
    exit 3
}
