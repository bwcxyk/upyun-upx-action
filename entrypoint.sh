#!/bin/sh

apk update \
 && apk add --no-cache wget \
 && wget -O upx.tar.gz https://github.com/upyun/upx/releases/download/v0.4.3/upx_0.4.3_Linux_x86_64.tar.gz \
 && tar -zxf upx.tar.gz \
 && chmod +x upx \
 && mv upx /usr/local/bin/upx

### 执行upx upload
upx login ${UPX_SERVICENAME} ${UPX_OPERATOR} ${UPX_PASSWORD}

# 删除所有文件
# upx rm -d
# echo "upx rm successful!"
# 上传文件
# upx upload -all --remote ${remote_path} ${local_path}/*
# 增量同步文件
# upx -q sync -w 10 ${LOCAL_DIR} ${REMOTE_DIR}
upx sync -w 10 ${LOCAL_DIR} ${REMOTE_DIR}
echo "upx upload successful!"
upx logout
