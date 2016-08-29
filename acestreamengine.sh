#!/usr/bin/env sh

DIR="/usr/local/acestream_3.0.2_centos_7_amd64"
LD_LIBRARY_PATH="/usr/local/ssl/lib" exec $DIR/acestreamengine --lib-path "$DIR" "$@"
