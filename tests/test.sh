#!/bin/bash
set -xe

export IMAGE_NAME="fvigotti/docker-jmxtrans"
docker build -t "${IMAGE_NAME}" ../src

docker run --rm -ti \
    "${IMAGE_NAME}"

