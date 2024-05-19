# tolua_runtime
**Build**<br>
编译脚本命名规则<br>
build\_<lua版本>\_<编译平台>\_<目标平台>\_<cpu架构>.sh
可以直接在github的Action标签下运行对应的workflow

NDK 版本:android-ndk-r26d 默认安装到 D:/android-ndk-r26d<br>
将D:/android-ndk-r26d/build加入环境变量<br>
如果使用msys2环境将 /d/android-ndk-r26d 加入环境变量<br>
export PATH="/d/android-ndk-r26d:${PATH}"

## 注意:
现在ios 和 osx 还没有处理，luajit的android编译脚本也有问题还未处理

# Libs
**cjson**<br>
https://github.com/mpx/lua-cjson<br>
**LuaSocket** <br>
https://github.com/diegonehab/luasocket<br>
**struct**<br>
http://www.inf.puc-rio.br/~roberto/struct/<br>
**lpeg**<br>
http://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html<br>

## 新增的庫
**sproto**<br>
https://github.com/cloudwu/sproto<br>
參考: https://github.com/jarjin/tolua_runtime_V2
**skynet.crypt**<br>
https://github.com/cloudwu/skynet<br>
參考: https://www.jianshu.com/p/3c5db3e6b4e7
**lua-protobuf**<br>
https://github.com/starwing/lua-protobuf<br>
參考: https://john.js.org/2020/11/02/Old-ToLua-Compile-With-lua-protobuf/

# [runtime库编译文档](https://github.com/NewbieGameCoder/tolua_runtime/wiki)
