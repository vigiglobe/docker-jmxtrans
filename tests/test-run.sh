#!/bin/bash
set -xe

SRC_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/../src/"

export IMAGE_NAME="fvigotti/docker-jmxtrans"


docker run --rm -ti \
    --name jmxt \
    --net="host" \
    -v /tmp:/tmp/a:ro   \
    -v ${SRC_DIR}/run-jmxtrans.sh:/usr/bin/run-jmxtrans.sh:ro   \
    -v ${SRC_DIR}/../tests/local_jmx.json:/local_jmx.json:ro   \
    -v /tmp/jmxt:/var/log/jmxtrans  \
    -e "FILENAME=/local_jmx.json" \
    -e "HEAP_SIZE=128" \
    -e "PERM_SIZE=64" \
    "${IMAGE_NAME}" \
    /usr/bin/run-jmxtrans.sh

    #-v ${SRC_DIR}/run-jmxtrans.sh:/usr/bin/run-jmxtrans.sh:ro   \
    #-v ${SRC_DIR}/../test/local_jmx.json:/tmp/local_jmx.json:ro   \

