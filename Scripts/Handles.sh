#!/bin/bash

PKG_PATCH="$GITHUB_WORKSPACE/wrt/package/"

#修复freeswitch依赖缺失
FW_FILE=$(find ../feeds/telephony/ -maxdepth 3 -type f -wholename "*/freeswitch/Makefile")
if [ -f "$FW_FILE" ]; then
	sed -i "s/libpcre/libpcre2/g" $FW_FILE

	cd $PKG_PATCH && echo "freeswitch has been fixed!"
fi
