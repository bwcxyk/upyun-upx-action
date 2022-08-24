#!/bin/sh -l

set -ex

apk update \
 && apk add --no-cache wget \
 && wget -O upx.tar.gz http://collection.b0.upaiyun.com/softwares/upx/upx_0.3.6_linux_x86_64.tar.gz \
 && tar -zxf upx.tar.gz \
 && chmod +x upx \
 && mv upx /usr/local/bin/upx

### 执行upx upload
upx login ${inputs.bucket} ${inputs.operator} ${inputs.operator_password}
echo "start upx upload!"
upx sync ${inputs.local_path} ${inputs.remote_path} --delete
echo "upx upload successful!"
upx logout