# tolua_runtime
**Build**<br>
**lua5.1.5**<br>
windows pc: build_win32.sh build_win64.h  (mingw + luajit2.1.0-beta3) choose 1<br>
linux pc(**ubuntu18.04 amd64**): build_linux32.sh build_linux64.h  (gcc + luajit2.1.0-beta3) choose 1<br>
android: build_arm.sh build_x86.sh (mingw + luajit2.1.0-beta3) choose 1<br>
mac: build_osx.sh (xcode + luac5.1.5 for luajit can't run on unity5) choose 1<br>
ios: build_ios.sh (xcode + luajit2.1.0-beta3) choose 1<br>
**lua5.3**<br>
windows pc: build_win32.sh build_win64.h  (mingw + lua5.3) choose 2<br>
linux pc: build_linux32.sh(**ubuntu16.04 i386**) build_linux64.h(**ubuntu18.04 amd64**)  (gcc + lua5.3) choose 2<br>
android: build_arm.sh build_x86.sh (mingw + lua5.3) choose 2<br>
mac: build_osx.sh (xcode + lua5.3 ) choose 2<br>
ios: build_ios.sh (xcode + lua5.3 ) choose 2<br>

NDK 版本:android-ndk-r26d 默认安装到 D:/android-ndk-r26d<br>
将D:/android-ndk-r26d/build加入环境变量<br>
如果使用msys2环境将 /d/android-ndk-r26d/build 加入环境变量<br>
export PATH="/d/android-ndk-r26d/build:${PATH}"

# Libs
**cjson**<br>
https://github.com/mpx/lua-cjson<br>
**protoc-gen-lua**<br>
https://github.com/topameng/protoc-gen-lua<br>
**LuaSocket** <br>
https://github.com/diegonehab/luasocket<br>
**struct**<br>
http://www.inf.puc-rio.br/~roberto/struct/<br>
**lpeg**<br>
http://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html

# [runtime库编译文档](https://github.com/NewbieGameCoder/tolua_runtime/wiki)
