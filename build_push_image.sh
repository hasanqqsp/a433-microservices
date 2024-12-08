#!/bin/bash

# Membuat Docker image
docker build -t item-app:v1 .

# Melihat daftar image di lokal
docker images

# Mengubah nama image
# docker tag item-app:v1 hasanqqsp/item-app:v1

# Mengubah nama image untuk GHCR
docker tag item-app:v1 ghcr.io/hasanqqsp/item-app:v1

# Login ke Docker Hub
# echo $PASSWORD_DOCKER_HUB | docker login -u hasanqqsp --password-stdin

# Login ke GHCR
echo $CR_PAT | docker login ghcr.io -u hasanqqsp --password-stdin

# Mengunggah image ke Docker Hub
# docker push hasanqqsp/item-app:v1

# Mengunggah image ke GHCR
docker push ghcr.io/hasanqqsp/item-app:v1