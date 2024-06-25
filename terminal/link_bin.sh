#!/bin/bash
FILE_DIR=$(dirname $0)

for BIN_NAME in $(ls ${FILE_DIR}/bin); do
    BIN_FILE_DIR=$(realpath "${FILE_DIR}/bin/${BIN_NAME}" | xargs dirname)
    BIN_FILE="${BIN_FILE_DIR}/${BIN_NAME}"
    ln -sf "${BIN_FILE}" ~/.local/bin
done