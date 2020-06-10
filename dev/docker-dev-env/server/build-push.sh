#!/bin/bash

set -e

# Vars for tags
COMMIT_ID=$(git rev-parse --short=7 HEAD)
IMAGE_TAG=$1
IMAGE_TAG_COMMIT="${IMAGE_TAG}:${COMMIT_ID}"
IMAGE_TAG_LATEST="${IMAGE_TAG}:latest"
if [ ! -z ${environment:-} ]; then
   IMAGE_TAG_ENVIRONMENT="${IMAGE_TAG}:${environment}-latest"
fi

# Vars for docker build
GIT_ROOT=$(git rev-parse --show-toplevel)
if [ -z "$GIT_ROOT" ]; then
   GIT_ROOT=$(git rev-parse --show-superproject-working-tree)
fi
BUILD_CONTEXT=$(pwd)
DOCKERFILE_PATH=$(pwd)/Dockerfile


# BUILD
# Copy the compiled binary
cp -vrf ${GIT_ROOT}/pkg/linux_amd64/nomad ${BUILD_CONTEXT}/

echo "Building ${IMAGE_TAG} with commit ${COMMIT_ID}"
COMMAND=""
COMMAND+="DOCKER_BUILDKIT=1 docker build \
 -t ${IMAGE_TAG_COMMIT} \
 -t ${IMAGE_TAG_LATEST} \
 -f ${DOCKERFILE_PATH}
"

if [ ! -z ${environment:-} ]; then
   echo "Adding Tag ${IMAGE_TAG_ENVIRONMENT}"
   COMMAND+=" -t ${IMAGE_TAG_ENVIRONMENT}"
fi

COMMAND+=" ${BUILD_CONTEXT}"

echo "Running ${COMMAND}"
eval ${COMMAND}

# PUSH
echo "pushing image ${IMAGE_TAG_COMMIT}"
docker push ${IMAGE_TAG_COMMIT}
docker push ${IMAGE_TAG_LATEST}
if [ ! -z ${IMAGE_TAG_ENVIRONMENT:-} ]; then
    echo "pushing image ${IMAGE_TAG_ENVIRONMENT}"
    docker push "${IMAGE_TAG_ENVIRONMENT}"
fi
