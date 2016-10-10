#!/bin/bash -u

VERSION_NUMBER=${1}

docker build -t sebgdotfiles-debian-pkg-builder .

CONTAINER_ID=$(docker create -e VERSION_NUMBER="$VERSION_NUMBER" sebgdotfiles-debian-pkg-builder)

docker start -ai ${CONTAINER_ID}

docker cp ${CONTAINER_ID}:/tmp/sebgdotfiles_${VERSION_NUMBER}.deb .

mkdir -p releases/$VERSION_NUMBER/ && mv sebgdotfiles_${VERSION_NUMBER}.deb releases/$VERSION_NUMBER/
