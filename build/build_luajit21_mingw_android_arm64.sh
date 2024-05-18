# windows mingw 平台下编译luajit版本tolua
# 目前编译luajit有问题，还没找到如何解决

CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR=$(dirname ${CURR_DIR})
OUTPUT_DIR="output/lua53/android"

LUAJIT_DIR="luajit-2.1"
LUA_PATH=${LUAJIT_DIR}
LUA_LIBNAME="libluajit"
LUA_LINKPATH="build/luajit21/android"

cd ${PROJECT_DIR}

# Android/ARM, armeabi-v7a (ARMv7 VFP), Android 4.0+ (ICS)
NDK=D:/android-ndk-r16b
NDKABI=21
NDKTRIPLE=aarch64-linux-android
NDKVER=$NDK/toolchains/$NDKTRIPLE-4.9
NDKP=$NDKVER/prebuilt/windows-x86_64/bin/$NDKTRIPLE-
NDKF="-isystem $NDK/sysroot/usr/include/$NDKTRIPLE -D__ANDROID_API__=$NDKABI -D_FILE_OFFSET_BITS=64"
NDK_SYSROOT_BUILD=$NDK/sysroot
NDK_SYSROOT_LINK=$NDK/platforms/android-$NDKABI/arch-arm64
NDKARCH="-DLJ_ABI_SOFTFP=0 -DLJ_ARCH_HASFPU=1 -DLUAJIT_ENABLE_GC64=1"

# compile the luajit
cd ${PROJECT_DIR}/${LUA_PATH}/src
make clean        
make HOST_CC="gcc -m64" CROSS=$NDKP TARGET_FLAGS="$NDKF $NDKARCH" TARGET_SYS=Linux TARGET_SHLDFLAGS="--sysroot $NDK_SYSROOT_LINK"  TARGET_LDFLAGS="--sysroot $NDK_SYSROOT_LINK" TARGET_CFLAGS="--sysroot $NDK_SYSROOT_BUILD"
cp ./${LUA_LIBNAME}.a ${PROJECT_DIR}/${LUA_LINKPATH}/jni/
make clean    	

# compile the tolua
cd ${PROJECT_DIR}/${LUA_LINKPATH}
$NDK/ndk-build.cmd clean APP_ABI="armeabi-v7a,arm64-v8a" APP_PLATFORM=android-$NDKABI
$NDK/ndk-build.cmd APP_ABI="arm64-v8a" APP_PLATFORM=android-$NDKABI
cp libs/arm64-v8a/libtolua.so ${PROJECT_DIR}/${OUTPUT_DIR}/arm64-v8a/
$NDK/ndk-build.cmd clean APP_ABI="armeabi-v7a,,arm64-v8a" APP_PLATFORM=android-$NDKABI