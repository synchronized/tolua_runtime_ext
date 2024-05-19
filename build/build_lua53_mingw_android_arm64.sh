CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR=$(dirname ${CURR_DIR})
OUTPUT_DIR="output/lua53/android"

LUA_DIR="3rd/lua53"
LUA_PATH=${LUA_DIR}
LUA_LIBNAME="liblua"
LUA_LINKPATH="build/lua53/android"

cd ${PROJECT_DIR}

# create output directory
mkdir -p ${OUTPUT_DIR}/arm64-v8a

# Android/ARM, armeabi-v7a (ARMv7 VFP), Android 4.0+ (ICS)
NDKABI=21

# compile the lua
cd ${PROJECT_DIR}/${LUA_PATH}/src
ndk-build.cmd clean APP_ABI="arm64-v8a" APP_PLATFORM=android-$NDKABI
ndk-build.cmd APP_ABI="arm64-v8a" APP_PLATFORM=android-$NDKABI
cp obj/local/arm64-v8a/${LUA_LIBNAME}.a ${PROJECT_DIR}/${LUA_LINKPATH}/jni/
ndk-build.cmd clean APP_ABI="arm64-v8a" APP_PLATFORM=android-$NDKABI

# compile the tolua
cd ${PROJECT_DIR}/${LUA_LINKPATH}
ndk-build.cmd clean APP_ABI="arm64-v8a" APP_PLATFORM=android-$NDKABI
ndk-build.cmd APP_ABI="arm64-v8a" APP_PLATFORM=android-$NDKABI
cp libs/arm64-v8a/libtolua.so ${PROJECT_DIR}/${OUTPUT_DIR}/arm64-v8a/
ndk-build.cmd clean APP_ABI="arm64-v8a" APP_PLATFORM=android-$NDKABI