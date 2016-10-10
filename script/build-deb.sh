#!/bin/bash -uvx

echo "Building package for version number ${VERSION_NUMBER}"

PKG_DIR="${WORK_DIR}/${PKG_NAME}_${VERSION_NUMBER}"

cd ${WORK_DIR}

mkdir ${PKG_DIR} && cd ${PKG_DIR} \
                 && cp -a ${CODE_DIR}/src/. . \
                 && sed -i.bak "s/<<VERSION_NUMBER>>/${VERSION_NUMBER}/g" DEBIAN/control

cd ${WORK_DIR} && dpkg-deb --build ${PKG_NAME}_${VERSION_NUMBER}

ls ${PKG_NAME}_${VERSION_NUMBER}.deb
