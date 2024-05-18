# tolua_runtime
**Build**<br>
编译脚本命名规则<br>
build\_<lua版本>\_<编译平台>\_<目标平台>\_<cpu架构>.sh

NDK 版本:android-ndk-r26d 默认安装到 D:/android-ndk-r26d<br>
将D:/android-ndk-r26d/build加入环境变量<br>
如果使用msys2环境将 /d/android-ndk-r26d 加入环境变量<br>
export PATH="/d/android-ndk-r26d:${PATH}"


## 注意:
现在ios 和 osx 还没有处理，luajit的android编译脚本也有问题还未处理

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
