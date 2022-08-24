# Container image that runs your code
FROM alpine:3.12

RUN apk update \
 && apk add --no-cache wget \
 && wget -O upx.tar.gz http://collection.b0.upaiyun.com/softwares/upx/upx_0.3.6_linux_x86_64.tar.gz \
 && tar -zxf upx.tar.gz \
 && chmod +x upx
