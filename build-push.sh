#!/bin/bash

IMAGE="traefik-auth-cloudflare"
VERSION="2025.04.26"

docker buildx build --platform linux/amd64,linux/arm64 --build-arg VERSION=${VERSION} -t manelpb/${IMAGE}:${VERSION} . --push