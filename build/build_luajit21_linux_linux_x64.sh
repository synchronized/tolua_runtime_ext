#!/bin/bash
# 64 Bit Version
# build for Ubuntu18.04

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR=$(dirname ${CURR_DIR})
OUTPUT_DIR="output/luajit21/linux/x86_64"

LUA_JITDIR="3rd/luajit-2.1"
LUA_PATH=${LUA_JITDIR}
LUA_LIBNAME="libluajit"

cd ${PROJECT_DIR}

# create output directory
mkdir -p ${OUTPUT_DIR}

cd ${PROJECT_DIR}/${LUA_PATH}
make clean
make BUILDMODE=static CC="gcc -fPIC -m64 -O2" XCFLAGS=-DLUAJIT_ENABLE_GC64
cp src/${LUA_LIBNAME}.a ${PROJECT_DIR}/${OUTPUT_DIR}
make clean

echo -e "\n[MAINTAINCE] build ${LUA_LIBNAME}.a done\n"

# compile the tolua
cd ${PROJECT_DIR}
gcc -m64 -O2 -std=gnu99 -shared \
    src/tolua.c \
    src/int64.c \
    src/uint64.c \
    src/pb.c \
    src/struct.c \
    3rd/lpeg/lpcap.c \
    3rd/lpeg/lpcode.c \
    3rd/lpeg/lpprint.c \
    3rd/lpeg/lptree.c \
    3rd/lpeg/lpvm.c \
    3rd/cjson/strbuf.c \
    3rd/cjson/lua_cjson.c \
    3rd/cjson/fpconv.c \
    3rd/luasocket/auxiliar.c \
    3rd/luasocket/buffer.c \
    3rd/luasocket/except.c \
    3rd/luasocket/inet.c \
    3rd/luasocket/io.c \
    3rd/luasocket/luasocket.c \
    3rd/luasocket/mime.c \
    3rd/luasocket/options.c \
    3rd/luasocket/select.c \
    3rd/luasocket/tcp.c \
    3rd/luasocket/timeout.c \
    3rd/luasocket/udp.c \
    3rd/luasocket/usocket.c \
    3rd/luasocket/compat.c \
    3rd/sproto/sproto.c \
    3rd/sproto/lsproto.c \
    3rd/skynet/crypt/lsha1.c \
    3rd/skynet/crypt/lua-crypt.c \
    -fPIC\
    -o ${OUTPUT_DIR}/libtolua.so \
    -Isrc/ \
    -I${LUA_PATH}/src \
    -I3rd/cjson \
    -I3rd/luasocket \
    -I3rd/lpeg \
    -Wl,--whole-archive ${OUTPUT_DIR}/${LUA_LIBNAME}.a \
    -Wl,--no-whole-archive -static-libgcc -static-libstdc++

if [ "$?" = "0" ]; then
	echo -e "\n[MAINTAINCE] build libtolua.so success"
else
	echo -e "\n[MAINTAINCE] build libtolua.so failed"
fi
