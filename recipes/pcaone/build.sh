#!/bin/bash

mkdir -p ${PREFIX}/bin
# fix zlib issue
export CFLAGS="$CFLAGS -I${PREFIX}/include"
export CXXFLAGS="${CXXFLAGS} -O3"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"

# sed -i.bak 's|-lpthread|-pthread|' Makefile
# rm -rf *.bak

make MKLROOT="${PREFIX}" -j"${CPU_COUNT}"
install -v -m 0755 PCAone ${PREFIX}/bin
