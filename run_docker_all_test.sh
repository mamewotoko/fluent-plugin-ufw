#! /bin/bash
IMAGE_VERSION="v0.12.39 v0.14.20"

for v in $IMAGE_VERSION; do
    sed "s/%%IMAGE_VERSION%%/$v/" Dockerfile.template > Dockerfile
    sh run_docker_test.sh
done

