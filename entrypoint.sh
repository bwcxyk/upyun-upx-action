#!/bin/sh -l

set -ex

apk update \
 && apk add --no-cache wget \
 && wget -O upx.tar.gz https://collection.b0.upaiyun.com/softwares/upx/upx_0.4.1_linux_x86_64.tar.gz \
 && tar -zxf upx.tar.gz \
 && chmod +x upx

### 执行upx upload
./upx login ${bucket} ${operator} ${operator_password}

./upx sync ${local_path} ${remote_path} --delete --strong
echo "upx upload successful!"
./upx logout
