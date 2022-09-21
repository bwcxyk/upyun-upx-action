#!/bin/sh -l

set -ex

apk update \
 && apk add --no-cache wget \
 && wget -O upx.tar.gz http://collection.b0.upaiyun.com/softwares/upx/upx_0.3.6_linux_x86_64.tar.gz \
 && tar -zxf upx.tar.gz \
 && chmod +x upx \
 && mv upx /usr/local/bin/upx

### 执行upx upload
upx login ${bucket} ${operator} ${operator_password}
echo "start delete!"
upx rm -a /*
echo "start upx upload!"
upx put ${local_path} ${remote_path}
#upx sync ${local_path} ${remote_path} --delete
echo "upx upload successful!"
upx logout
