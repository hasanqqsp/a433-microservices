#!/bin/bash

# Nama image yang akan dibuat
IMAGE_NAME="shipping-service"

# Versi image
IMAGE_VERSION=latest

# Nama repository di GHCR
REPO_NAME="hasanqqsp/shipping-service"

# Direktori tempat script ini berada
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Build image
docker build -t $IMAGE_NAME:$IMAGE_VERSION -f $SCRIPT_DIR/Dockerfile .

# Tag image dengan repository GHCR
docker tag $IMAGE_NAME:$IMAGE_VERSION ghcr.io/$REPO_NAME:$IMAGE_VERSION

# Login ke GHCR
echo $GHCR_TOKEN | docker login ghcr.io -u $GHCR_USERNAME --password-stdin

# Push image ke GHCR
docker push ghcr.io/$REPO_NAME:$IMAGE_VERSION

# Hapus image lokal
docker rmi $IMAGE_NAME:$IMAGE_VERSION
docker rmi ghcr.io/$REPO_NAME:$IMAGE_VERSION