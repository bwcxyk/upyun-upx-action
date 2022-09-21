#!/bin/sh -l

set -ex

apk update \
 && apk add --no-cache wget \
 && wget -O upx.tar.gz http://collection.b0.upaiyun.com/softwares/upx/upx_0.3.6_linux_x86_64.tar.gz \
 && tar -zxf upx.tar.gz \
 && chmod +x upx

### 执行upx upload
./upx login ${bucket} ${operator} ${operator_password}

if [[ $(./upx ls) ]]; then
    echo "start delete!"
    ./upx rm -a hugo/*
  else
    echo "start upx upload!"
fi
./upx put ${local_path} ${remote_path}
#./upx sync ${local_path} ${remote_path} --delete
echo "upx upload successful!"
./upx logout
