#!/bin/sh -l

set -ex

apk update \
 && apk add --no-cache wget \
 && wget -O upx.tar.gz https://github.com/upyun/upx/releases/download/v0.4.3/upx_0.4.3_Linux_x86_64.tar.gz \
 && tar -zxf upx.tar.gz \
 && chmod +x upx \
 && mv upx /usr/local/bin/upx

### 执行upx upload
upx login ${bucket} ${operator} ${operator_password}

# 删除所有文件
upx cd ${remote_path}
upx rm -a || exit 0
echo "upx rm successful!"
# 上传文件
upx upload -all --remote ${remote_path} ${local_path}/*
# 增量同步文件
# ./upx sync ${local_path} ${remote_path}
echo "upx upload successful!"
upx logout
