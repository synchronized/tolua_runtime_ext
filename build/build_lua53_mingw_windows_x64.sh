#!/bin/bash
# 64 Bit Version

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR=$(dirname ${CURR_DIR})
OUTPUT_DIR="output/lua53/windows/x86_64"

LUA_DIR="3rd/lua53"
LUA_PATH=${LUA_DIR}
LUA_LIBNAME="liblua"

cd ${PROJECT_DIR}

# create output directory
mkdir -p ${OUTPUT_DIR}

# compile the lua
cd ${PROJECT_DIR}/${LUA_PATH}
mingw32-make clean
mingw32-make mingw BUILDMODE=static CC="gcc -m64 -std=gnu99"
cp src/${LUA_LIBNAME}.a ${PROJECT_DIR}/${OUTPUT_DIR}/${LUA_LIBNAME}.a
mingw32-make clean

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
    3rd/luasocket/wsocket.c \
    3rd/luasocket/compat.c \
    3rd/sproto/sproto.c \
    3rd/sproto/lsproto.c \
    3rd/skynet/crypt/lsha1.c \
    3rd/skynet/crypt/lua-crypt.c \
    -o ${OUTPUT_DIR}/tolua.dll \
    -Isrc/ \
    -I${LUA_PATH}/src \
    -I3rd/cjson \
    -I3rd/luasocket \
    -I3rd/lpeg \
    -lws2_32 \
    -Wl,--whole-archive ${OUTPUT_DIR}/${LUA_LIBNAME}.a \
    -Wl,--no-whole-archive -static-libgcc -static-libstdc++

echo "build tolua.dll success"