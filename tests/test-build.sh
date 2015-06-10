#!/bin/bash
set -xe

SRC_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/../src/"

export IMAGE_NAME="fvigotti/docker-jmxtrans"
docker build -t "${IMAGE_NAME}" ../src

