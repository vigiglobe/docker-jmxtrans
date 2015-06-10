#!/bin/bash
set -xe

SRC_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/../src/"

export IMAGE_NAME="fvigotti/docker-jmxtrans"

docker run --rm -ti \
    -v /tmp:/tmp/a:ro   \
    "${IMAGE_NAME}"

    #-v ${SRC_DIR}/run-jmxtrans.sh:/usr/bin/run-jmxtrans.sh:ro   \
    #-v ${SRC_DIR}/../test/local_jmx.json:/tmp/local_jmx.json:ro   \

