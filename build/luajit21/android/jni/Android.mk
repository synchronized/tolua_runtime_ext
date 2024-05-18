LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libluajit
LOCAL_SRC_FILES := libluajit.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE := tolua

LOCAL_TO_PROJECT = ../../../..

LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(LOCAL_TO_PROJECT)/3rd/luajit-2.1/src
LOCAL_C_INCLUDES += $(LOCAL_PATH)/$(LOCAL_TO_PROJECT)/src

LOCAL_CPPFLAGS := -O2
LOCAL_CFLAGS :=  -O2 -std=gnu99
LOCAL_SRC_FILES :=	$(LOCAL_TO_PROJECT)/src/tolua.c \
					$(LOCAL_TO_PROJECT)/src/int64.c \
					$(LOCAL_TO_PROJECT)/src/uint64.c \
					$(LOCAL_TO_PROJECT)/src/pb.c \
					$(LOCAL_TO_PROJECT)/src/struct.c \
					$(LOCAL_TO_PROJECT)/3rd/lpeg/lpcap.c \
					$(LOCAL_TO_PROJECT)/3rd/lpeg/lpcode.c \
					$(LOCAL_TO_PROJECT)/3rd/lpeg/lpprint.c \
					$(LOCAL_TO_PROJECT)/3rd/lpeg/lptree.c \
					$(LOCAL_TO_PROJECT)/3rd/lpeg/lpvm.c \
					$(LOCAL_TO_PROJECT)/3rd/cjson/strbuf.c \
					$(LOCAL_TO_PROJECT)/3rd/cjson/lua_cjson.c \
					$(LOCAL_TO_PROJECT)/3rd/cjson/fpconv.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/auxiliar.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/buffer.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/except.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/inet.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/io.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/luasocket.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/mime.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/options.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/select.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/tcp.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/timeout.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/udp.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/usocket.c \
					$(LOCAL_TO_PROJECT)/3rd/luasocket/compat.c \
					
LOCAL_WHOLE_STATIC_LIBRARIES += libluajit
include $(BUILD_SHARED_LIBRARY)