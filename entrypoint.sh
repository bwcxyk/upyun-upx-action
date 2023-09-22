#!/bin/sh -l

set -ex

apk update \
 && apk add --no-cache wget \
 && wget -O upx.tar.gz https://collection.b0.upaiyun.com/softwares/upx/upx_0.4.1_linux_x86_64.tar.gz \
 && tar -zxf upx.tar.gz \
 && chmod +x upx

### 执行upx upload
./upx login ${bucket} ${operator} ${operator_password}

# 删除所有文件
"./upx rm -a ${remote_path}"
# 上传文件
./upx upload -all --remote ${remote_path} ${local_path}/*
# 增量同步文件
# ./upx sync ${local_path} ${remote_path} --delete --strong
echo "upx upload successful!"
./upx logout
