#!/bin/bash -u

VERSION_NUMBER=${1}

docker build -t seb-dotfiles-debian-pkg-builder .

CONTAINER_ID=$(docker create -e VERSION_NUMBER="$VERSION_NUMBER" seb-dotfiles-debian-pkg-builder)

docker start -ai ${CONTAINER_ID}

docker cp ${CONTAINER_ID}:/tmp/seb-dotfiles_${VERSION_NUMBER}.deb .

mkdir -p releases/$VERSION_NUMBER/ && mv seb-dotfiles_${VERSION_NUMBER}.deb releases/$VERSION_NUMBER/
