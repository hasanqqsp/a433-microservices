#!/bin/bash

# Nama image yang akan dibuild
IMAGE_NAME="karsajobs-ui"

# Versi image
IMAGE_VERSION="latest"


# Namespace GHCR
GHCR_NAMESPACE="hasanqqsp"

# Build image
docker build -t $IMAGE_NAME:$IMAGE_VERSION .

# Login ke GHCR
echo $CR_PAT | docker login ghcr.io -u $GHCR_NAMESPACE --password-stdin

# Tag image dengan repository GHCR
docker tag $IMAGE_NAME:$IMAGE_VERSION ghcr.io/$GHCR_NAMESPACE/$IMAGE_NAME:$IMAGE_VERSION

# Push image ke GHCR
docker push ghcr.io/$GHCR_NAMESPACE/$IMAGE_NAME:$IMAGE_VERSION